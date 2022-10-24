import taggy/xmlparser

let xmlFragments = @[
  r"""<tag></tag>""",
  r"""<tag id="123" bar="the thing"><foo>here</foo><foo2></foo2></tag>"""
]

for xmlFragment in xmlFragments:
  # echo $parsexml(xmlFragment)
  doAssert $parseXml(xmlFragment) == xmlFragment
