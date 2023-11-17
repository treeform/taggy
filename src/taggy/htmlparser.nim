import taggy/xmlparser {.all.}, taggy/entities

export Element, `[]`, `[]=`

const
  SelfClosingTags = [
    "area",
    "base",
    "br",
    "col",
    "embed",
    "hr",
    "img",
    "input",
    "keygen",
    "link",
    "meta",
    "param",
    "source",
    "track",
    "wbr"
  ]

proc parseHtmlElement(p: ParseCtx): Element =
  result = p.parseElementHead()

  if result.tagName notin SelfClosingTags:
    var text: string
    while p.hasMore:
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
          result.children.add p.parseHtmlElement()
      else:
        text.add p.at
        inc p

proc parseHtml(p: ParseCtx): Element =
  p.eatWhiteSpace()
  p.parseHtmlElement()

proc parseHtml*(data: string): Element =
  var p = ParseCtx(s: data)
  p.parseHtml()

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

    result.add '>'

    if e.tagName notin SelfClosingTags:

      result.add e.content.encodeHtmlEntities()

      for c in e.children:
        result.add $c

      result.add "</"
      result.add e.tagName
      result.add '>'
