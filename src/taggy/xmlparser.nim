# sipler xml/html parser
import strutils, strformat

type
  XmlyError* = object of ValueError ## Raised if an operation fails.

  StringMap* = seq[(string, string)]

  ParseCtx = ref object
    s*: string
    i*: int

  Element* = ref object
    content*: string
    tagName*: string
    attributes*: StringMap
    children*: seq[Element]

const
  WhiteSpace = {' ', '\n', '\r', '\t'}

func `[]`*(query: StringMap, key: string): string =
  ## Get a key out of attributes or "".
  for (k, v) in query:
    if k == key:
      return v

func `[]=`*(query: var StringMap, key, value: string) =
  ## Sets an attribute.
  for pair in query.mitems:
    if pair[0] == key:
      pair[1] = value
      return
  query.add((key, value))

func contains*(query: var StringMap, key: string): bool =
  ## Returns of attribute exists.
  for pair in query.mitems:
    if pair[0] == key:
      return true

proc `[]`*(e: Element, id: int): Element =
  ## Get a child element by index.
  e.children[id]

proc add*(e: Element, child: Element) =
  ## Adds a child element.
  e.children.add child

proc newElement*(tagName: string): Element =
  ## Creates a new element.
  result = Element()
  result.tagName = tagName

proc error(p: ParseCtx, msg: string) =
  var
    j = 0
    line: int
    column: int
  while j < p.i:
    if p.s[j] == '\n':
      inc line
      column = 0
    else:
      inc column
    inc j

  let message = &"{msg} [{line + 1}, {column+1}]"

  raise newException(XmlyError, message)

proc at(p: ParseCtx): char =
  p.s[p.i]

proc hasMore(p: ParseCtx): bool =
  if not(p.i < p.s.len):
    raise newException(XmlyError, "end reached")
  return true

proc inc(p: ParseCtx, value=1) =
  p.i.inc(value)

proc dec(p: ParseCtx, value=1) =
  p.i.dec(value)

proc eat(p: ParseCtx, c: char) =
  if p.at == c:
    inc p
  else:
    p.error(&"Excepted {c} but got {p.at}")

proc next(p: ParseCtx, c: char): bool =
  p.at == c

proc next(p: ParseCtx, s: string, caseIncentive = false): bool =
  if p.i + s.len > p.s.len:
    return false
  if caseIncentive:
    p.s[p.i ..< p.i + s.len].toLowerAscii() == s.toLowerAscii()
  else:
    p.s[p.i ..< p.i + s.len] == s

proc eat(p: ParseCtx, s: string) =
  for c in s:
    p.eat(c)

proc eatWhiteSpace(p: ParseCtx) =
  while p.hasMore:
    let c = p.at
    if c in WhiteSpace:
      inc p.i
    else:
      break

proc readWord(p: ParseCtx): string =
  while p.hasMore:
    let c = p.at
    if c in WhiteSpace or c in {'>', '='}:
      return
    else:
      result.add c
      inc p

proc readQuote(p: ParseCtx): string =
  let quote = p.at
  inc p
  while p.hasMore:
    let c = p.at
    if c == quote:
      inc p
      return
    else:
      result.add c
      inc p

proc readQuoteOrWord(p: ParseCtx): string =
  if p.at in {'\'', '"'}:
    p.readQuote()
  else:
    p.readWord()

proc parseAttribute(p: ParseCtx): (string, string) =
  let key = p.readWord()
  p.eatWhiteSpace()
  p.eat('=')
  p.eatWhiteSpace()
  let value = p.readQuoteOrWord()
  p.eatWhiteSpace()
  return (key, value)

proc parseSpecial(p: ParseCtx) =
  if p.next("<!DOCTYPE", caseIncentive=true):
    p.eat("<!DOCTYPE")
    p.eatWhiteSpace()
    discard p.readWord()
    p.eatWhiteSpace()
    p.eat(">")
    p.eatWhiteSpace()

proc parseXMLDeclaration(p: ParseCtx): Element =
  if p.next("<?xml", caseIncentive=true):
    result = Element()
    result.tagName = "?xml"
    p.eat("<?xml")
    p.eatWhiteSpace()
    while not p.next("?>"):
      result.attributes.add p.parseAttribute()
    p.eat("?>")
    p.eatWhiteSpace()

proc parseElementHead(p: ParseCtx): Element =
  result = Element()

  while p.next("<!"):
    p.parseSpecial()

  while p.next("<?"):
    discard p.parseXMLDeclaration()

  p.eat('<')
  p.eatWhiteSpace()
  result.tagName = p.readWord()
  p.eatWhiteSpace()
  while p.hasMore:
    if p.next('>'):
      break
    if p.next('/'):
      return
    result.attributes.add p.parseAttribute()
  p.eat('>')

proc parseXmlElement(p: ParseCtx): Element =
  result = p.parseElementHead()

  var text: string
  while p.hasMore:
    if p.next("/>"):
      # self closing
      p.eat("/>")
      return
    if p.next('<'):
      if text != "":
        result.children.add Element(content: text)
        text = ""
      p.eat('<')
      if p.next('/'):
        p.eat('/')
        p.eat(result.tagName)
        p.eat('>')
        return
      else:
        dec p
        result.children.add p.parseXmlElement()
    else:
      text.add p.at
      inc p

proc parseXml(p: ParseCtx): Element =
  p.eatWhiteSpace()
  p.parseXmlElement()

proc parseXml*(data: string): Element =
  var p = ParseCtx(s: data)
  p.parseXml()

proc `$`*(e: Element): string =
  if e.tagName == "":
    result.add e.content
  else:
    result.add '<'
    result.add e.tagName

    for (k, v) in e.attributes:
      result.add " "
      result.add k
      result.add "=\""
      result.add v
      result.add "\""

    # TODO: Self closing logic.

    result.add '>'

    for c in e.children:
      result.add $c

    result.add "</"
    result.add e.tagName
    result.add '>'
