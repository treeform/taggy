import macros, sets

const
  tags = [
    "a", "abbr", "acronym", "address", "applet", "area", "article", "aside",
    "audio", "b", "base", "basefont", "bdo", "big", "blockquote", "body", "br",
    "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup",
    "datalist", "dd", "del", "dfn", "div", "dl", "dt", "em", "embed",
    "fieldset", "figcaption", "figure", "font", "footer", "form", "frame",
    "frameset", "head", "header", "h1", "h2", "h3", "h4", "h5", "h6", "hr",
    "html", "i", "iframe", "img", "input", "ins", "kbd", "label", "legend",
    "li", "link", "main", "map", "mark", "meta", "meter", "nav", "noscript",
    "object", "ol", "optgroup", "option", "p", "param", "pre", "progress", "q",
    "s", "samp", "script", "section", "select", "small", "source", "span",
    "strike", "strong", "sub", "sup", "table", "tbody", "td", "textarea",
    "tfoot", "th", "thead", "time", "title", "tr", "ui", "ul", "var", "video",
    "wbr"
  ].toHashSet

  attributes = [
    "accept", "acceptCharset", "accesskey", "action", "alt", "async",
    "autocomplete", "autofocus", "autoplay", "charset", "checked", "cite",
    "class", "cols", "colspan", "property", "content", "contenteditable",
    "controls", "coords", "data", "datetime", "default", "defer", "dir",
    "dirname", "disabled", "download", "draggable", "enctype", "for", "form",
    "formaction", "headers", "height", "hidden", "high", "href", "hreflang",
    "httpEquiv", "id", "ismap", "kind", "label", "lang", "list", "loading",
    "loop", "low", "max", "maxlength", "media", "method", "min", "multiple",
    "muted", "name", "novalidate", "open", "optimum", "pattern", "placeholder",
    "poster", "preload", "readonly", "rel", "required", "reversed", "role",
    "rows", "rowspan", "sandbox", "scope", "selected", "shape", "size",
    "sizes", "span", "spellcheck", "src", "srcdoc", "srclang", "srcset",
    "start", "step", "style", "tabindex", "tabindex", "target", "title",
    "translate", "type", "usemap", "value", "width", "wrap", "crossOrigin",
    "onabort", "onafterprint", "onbeforeprint", "onbeforeunload", "onblur",
    "oncanplay", "oncanplaythrough", "onchange", "onclick", "oncontextmenu",
    "oncopy", "oncuechange", "oncut", "ondblclick", "ondrag", "ondragend",
    "ondragenter", "ondragleave", "ondragover", "ondragstart", "ondrop",
    "ondurationchange", "onemptied", "onended", "onerror", "onfocus",
    "onhashchange", "oninput", "oninvalid", "onkeydown", "onkeypress",
    "onkeyup", "onload", "onloadeddata", "onloadedmetadata", "onloadstart",
    "onmousedown", "onmousemove", "onmouseout", "onmouseover", "onmouseup",
    "onmousewheel", "onoffline", "ononline", "onpagehide", "onpageshow",
    "onpaste", "onpause", "onplay", "onplaying", "onpopstate", "onprogress",
    "onratechange", "onreset", "onresize", "onscroll", "onsearch", "onseeked",
    "onseeking", "onselect", "onstalled", "onstorage", "onsubmit", "onsuspend",
    "ontimeupdate", "ontoggle", "onunload", "onvolumechange", "onwaiting",
    "onwheel"
  ].toHashSet

  properties = [
    "accent-color", "align-content", "align-items", "align-self", "all",
    "animation", "animation-delay", "animation-direction", "animation-duration",
    "animation-fill-mode", "animation-iteration-count", "animation-name",
    "animation-play-state", "animation-timing-function", "backdrop-filter",
    "backface-visibility", "background", "background-attachment",
    "background-blend-mode", "background-clip", "background-color",
    "background-image", "background-origin", "background-position",
    "background-repeat", "background-size", "border", "border-bottom",
    "border-bottom-color", "border-bottom-left-radius",
    "border-bottom-right-radius", "border-bottom-style",
    "border-bottom-width", "border-collapse", "border-color", "border-image",
    "border-image-outset", "border-image-repeat", "border-image-slice",
    "border-image-source", "border-image-width", "border-left",
    "border-left-color", "border-left-style", "border-left-width",
    "border-radius", "border-radius", "border-right", "border-right-color",
    "border-right-style", "border-right-width", "border-spacing",
    "border-style", "border-top", "border-top-color", "border-top-left-radius",
    "border-top-right-radius", "border-top-style", "border-top-width",
    "border-width", "bottom", "bottom", "box-decoration-break", "box-shadow",
    "box-sizing", "break-after", "break-before", "break-inside", "caption-side",
    "caret-color", "clear", "clip", "color", "column-count", "column-fill",
    "column-gap", "column-rule", "column-rule-color", "column-rule-style",
    "column-rule-width", "column-span", "column-width", "columns", "content",
    "counter-increment", "counter-reset", "cursor", "direction", "display",
    "empty-cells", "filter", "flex", "flex-basis", "flex-direction",
    "flex-flow", "flex-grow", "flex-shrink", "flex-wrap", "float", "font",
    "font-family", "font-feature-settings", "font-kerning",
    "font-language-override", "font-size", "font-size", "font-size-adjust",
    "font-stretch", "font-style", "font-synthesis", "font-variant",
    "font-variant-alternates", "font-variant-caps", "font-variant-east-asian",
    "font-variant-ligatures", "font-variant-numeric", "font-variant-position",
    "font-weight", "font-weight", "gap", "gap", "grid", "grid-area", "grid-auto-columns", "grid-auto-flow", "grid-auto-rows", "grid-column", "grid-column-end", "grid-column-gap", "grid-column-start", "grid-gap", "grid-row", "grid-row-end", "grid-row-gap", "grid-row-start", "grid-template", "grid-template-areas", "grid-template-columns", "grid-template-rows", "hanging-punctuation", "height", "height", "hyphens", "image-rendering", "isolation", "justify-content", "keyframes", "left", "left", "letter-spacing", "line-break", "line-height", "line-height", "list-style", "list-style-image", "list-style-position", "list-style-type", "margin", "margin", "margin", "margin", "margin-bottom", "margin-bottom", "margin-left", "margin-left", "margin-right", "margin-right", "margin-top", "margin-top", "mask", "mask-clip", "mask-composite", "mask-image", "mask-mode", "mask-origin", "mask-position", "mask-repeat", "mask-size", "mask-type", "max-height", "max-height", "max-width", "max-width", "min-height", "min-height", "min-width", "min-width", "mix-blend-mode", "object-fit", "object-position", "opacity", "opacity", "order", "orphans", "outline", "outline-color", "outline-offset", "outline-style", "outline-width", "overflow", "overflow-wrap", "overflow-x", "overflow-y", "padding", "padding", "padding", "padding", "padding-bottom", "padding-bottom", "padding-left", "padding-left", "padding-right", "padding-right", "padding-top", "padding-top", "page-break-after", "page-break-before", "page-break-inside", "perspective", "perspective-origin", "pointer-events", "position", "property", "quotes", "resize", "right", "right", "row-gap", "scroll-behavior", "tab-size", "table-layout", "text-align", "text-align-last", "text-combine-upright", "text-decoration", "text-decoration-color", "text-decoration-line", "text-decoration-style", "text-decoration-thickness", "text-emphasis", "text-indent", "text-justify", "text-orientation", "text-overflow", "text-shadow", "text-transform", "text-underline-position", "top", "transform", "transform-origin", "transform-style", "transition", "transition-delay", "transition-duration", "transition-property", "transition-timing-function", "unicode-bidi", "user-select", "vertical-align", "visibility", "white-space", "widows", "width", "width", "word-break", "word-spacing", "word-wrap", "writing-mode", "z-index", "z-index", "zoom", "zoom"
  ].toHashSet

proc bufferAdd(builder: NimNode, node: NimNode) =
  builder.add nnkCommand.newTree(
    nnkDotExpr.newTree(
      newIdentNode("buffer"),
      newIdentNode("add")
    ),
    node
  )

proc bufferAdd(builder: NimNode, s: string) =

  # Is prev buffer add a lit as well? Then join them?
  if builder.len > 0 and builder[^1].len > 1:
    if builder[^1][0].len > 1 and builder[^1][0][1].strVal == "add":
      if builder[^1][1].kind == nnkStrLit:
        builder[^1][1].strVal = builder[^1][1].strVal & s
        return

  builder.bufferAdd(newLit(s))

proc walkStyle(builder: NimNode, node: NimNode) =
  builder.bufferAdd "style=\""
  for c in node.children:
    if c.kind == nnkCommand and c[0].strVal in properties:
      builder.bufferAdd c[0].strVal & ":"
      builder.bufferAdd c[1]
      builder.bufferAdd ";"
    else:
      echo "untested? ", repr(c)
      # builder.bufferAdd(c)

  builder.bufferAdd "\""

proc walk(builder: NimNode, node: NimNode) =
  #echo node.kind
  if node.kind == nnkCall:

    #echo "  ", node[0].strVal
    if node[0].strVal in tags:
      builder.bufferAdd "<" & node[0].strVal

      var first = true
      var firstAttr = true
      for c in node.children:
        if c.kind == nnkStmtList:
          for c2 in c:
            if c2.kind == nnkCommand and c2[0].strVal in attributes:
              if firstAttr:
                builder.bufferAdd " "
                firstAttr = false
              builder.bufferAdd c2[0].strVal & "=\""
              builder.walk(c2[1])
              builder.bufferAdd "\""
            if c2.kind == nnkCall and c2[0].strVal == "style":
              if firstAttr:
                builder.bufferAdd " "
                firstAttr = false
              builder.walkStyle(c2[1])

      builder.bufferAdd ">"

      first = true
      for c in node.children:
        if first:
          first = false
        else:
          builder.walk(c)

      builder.bufferAdd "</" & node[0].strVal & ">"

    elif node[0].strVal == "style":
      discard

    else:
      echo "untested? ", repr(node)
      builder.bufferAdd(node)

  elif node.kind == nnkCommand:
    if node[0].strVal in attributes:
      discard
    else:
      echo "untested? ", repr(node)
      builder.bufferAdd(node)

  elif node.kind == nnkStmtList:
    for c in node.children:
      builder.walk(c)

  elif node.kind == nnkForStmt:
    let builderBody = nnkStmtList.newTree()
    builderBody.walk(node[2])
    builder.add(nnkForStmt.newTree(
      node[0],
      node[1],
      builderBody
    ))

  elif node.kind == nnkIfStmt:
    let buildIf = nnkIfStmt.newTree()

    for branch in node.children:
      let builderBody = nnkStmtList.newTree()
      builderBody.walk(branch[1])
      buildIf.add(nnkElifBranch.newTree(
        branch[0],
        builderBody
      ))

    builder.add(buildIf)

  elif node.kind == nnkStrLit:
    builder.bufferAdd(node.strVal)

  else:
    builder.bufferAdd(node)

macro renderHtml*(body: untyped): untyped =
  ## Renders
  let builder = nnkStmtList.newTree(
    nnkVarSection.newTree(
      nnkIdentDefs.newTree(
        newIdentNode("buffer"),
        newEmptyNode(),
        newLit("")
      )
    )
  )
  builder.walk(body)
  builder.add(newIdentNode("buffer"))
  when isMainModule:
    echo repr(builder)
  return builder

when isMainModule:

  # dumpAstGen:
  #   if true:
  #     bar()

  let blogs = ["foo", "bar", "baz"]

  let x = renderHtml:
    html:
      head:
        title:
          "Micro Blog"
      body:
        style:
          color "red"

        h1:
          "Micro Blog"
        ui:
          for blogTitle in blogs:
            li:
              a:
                href "/posts/" & blogTitle
                blogTitle

  echo x
