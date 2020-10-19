## Include an example on how to use your library
import taggy, dom

block:
  var node = generate:
    tdiv:
      h1: text "Basic example"
      tdiv:
        id "main"
        class "round"
        color "red"
        text "hello world"
        onClick:
          echo "clicked"
  document.body.appendChild(node)

block:
  var node = generate:
    tdiv:
      h1: text "Just a text node (not a tag)"
      text "hey how are you?"
  document.body.appendChild(node)

block:
  var node = generate:
    tdiv:
      h1: text "Table with a for loop"
      table:
        tr:
          th: text "id"
          th: text "color"
          th: text "size"
        for i in 0 ..< 10:
          tr:
            td: text "#" & $i
            td: text ["red", "blue", "black"][i mod 3]
            td: text $(i*10)

  document.body.appendChild(node)

proc registerElement*(name: cstring) =
  {.emit:["class Tmp extends HTMLElement {}"].}
  {.emit:["window.customElements.define(", name, ", Tmp)"].}

block:
  registerElement("area-list")
  template areaList(body: untyped) = tag("area-list", body)

  registerElement("area-wrapper")
  template areaWrapper(body: untyped) = tag("area-wrapper", body)

  var node = generate:
    tdiv:
      h1: text "Custom HTML elements."
      areaList:
        display "block"
        for i in 0 ..< 10:
          areaWrapper:
            display "block"
            text "area:" & $i

  document.body.appendChild(node)

block:
  var node = generate:
    tdiv:
      h1: text "Hover/clicking example."
      tdiv:
        id "hover-clicking-div"
        backgroundColor: "red"
        cursor "pointer"
        userSelect "none"
        width: 100
        height: 100
        onClick:
          echo event.target.id
          echo "clicked"
        onMousemove:
          echo "hovering"

  document.body.appendChild(node)

block:
  var node = generate:
    tdiv:
      h1: text "Inputs example."
      input:
        ttype "button"
      input:
        ttype "checkbox"
      input:
        ttype "color"
      input:
        ttype "date"
      input:
        ttype "datetime-local"
      input:
        ttype "email"
      input:
        ttype "file"
      input:
        ttype "hidden"
      input:
        ttype "image"
      input:
        ttype "month"
      input:
        ttype "number"
      input:
        ttype "password"
      input:
        ttype "radio"
      input:
        ttype "range"
      input:
        ttype "reset"
      input:
        ttype "search"
      input:
        ttype "submit"
      input:
        ttype "tel"
      input:
        ttype "text"
      input:
        ttype "time"
      input:
        ttype "url"
      input:
        ttype "week"

  document.body.appendChild(node)
