import taggy/htmlparser

let htmlFragments = @[
  "<div><span><img></span></div>"
]

for htmlFragment in htmlFragments:
  # echo $parseHtml(htmlFragment)
  doAssert $parseHtml(htmlFragment) == htmlFragment
