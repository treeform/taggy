import taggy/htmlparser

let htmlFragments = @[
  r"""<div></div>""",
  r"""<div><span><img></span></div>""",
  r"""<body><label for="duration">Duration</label><input type="range" name="duration"></body>"""
]

for htmlFragment in htmlFragments:
  echo $parseHtml(htmlFragment)
  doAssert $parseHtml(htmlFragment) == htmlFragment
