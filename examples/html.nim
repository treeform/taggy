import taggy/htmlparser

block:
  let divElement = parseHtml("<div class='foo'><span><img src='img.png'></span></div>")
  echo divElement.attributes["class"]
  echo divElement[0][0].attributes["src"]

block:
  let divElement = newElement("div")
  divElement.attributes["class"] = "foo"
  let spanElement = newElement("span")
  let imgElement = newElement("img")
  imgElement.attributes["src"] = "img.png"
  spanElement.add(imgElement)
  divElement.add(spanElement)
  echo $divElement
