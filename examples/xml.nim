import taggy/xmlparser

block:
  let xmlNode = parseXml("""<tag id="123" bar="the thing"><foo>here</foo><foo2></foo2></tag>""")
  echo xmlNode.attributes["id"]
  echo xmlNode.attributes["bar"]
  echo xmlNode[0].tagName
  echo xmlNode[0][0].content
  echo xmlNode[1].tagName

block:
  let xmlNode = newElement("tag")
  xmlNode.attributes["id"] = "123"
  xmlNode.attributes["bar"] = "the thing"
  let fooNode = newElement("foo")
  let text = Element()
  text.content = "here"
  fooNode.add(text)
  xmlNode.add(fooNode)
  let foo2Node = newElement("foo2")
  xmlNode.add(foo2Node)
  echo $xmlNode
