# Taggy - Everything to do with HTML and XML<tags>.

**⚠️ This library is still in development and is NOT ready to be used. ⚠️**

Both the native C backend and the JS backend is supported. Use this library both server side and client side.

`nimble install taggy`

![Github Actions](https://github.com/treeform/taggy/workflows/Github%20Actions/badge.svg)

[API reference](https://treeform.github.io/taggy)

This library has no dependencies other than the Nim standard library.

* HTML Parser/Serializer
* XML Parser/Serializer
* Static HTML Generator
* Static CSS Generator

## Static HTML Generator

```nim
x = render:
  html:
    head:
      title:
        say "simple page"
      styleSheet:
        css "body":
          backgroundColor "black"
          color "white"
    body:
      h1:
        say "This is a simple page"
      p:
        say "Taggly allows server and client site html generation"
echo x
```

Note some things are reserved words in nim such as `div` or `method` those have a `t` appended to them becomeing `tdiv` or `tmethod`.

## Static CSS Generator

```nim
styleSheet:
  css "body":
    backgroundColor PureBlack
    fontFamily "IBM Plex Sans"
    fontStyle "normal"
    fontWeight 400
    fontSize 18
    lineHeight 23
    color PureWhite

  css "button.selected, .button.selected":
    backgroundColor "rgba(59, 0, 96, 1)"
```

You can use the regular `"10em"` or `"100%"` and `"10px"` but you can also omit the `"px"` and use the number `10` which means "10px" by default.

While making any HTML node you can generate inline style with the `style` keyword:

```nim
a:
  href "/manual.html"
  target "_blank"
  img ".help":
    style:
      position "absolute"
      right 6
      bottom 8
    src "/data/images/help.png"
```


## HTML parser and pretty printer

```nim
let htmlNode = parseHtml("<div><span><img src='img.png'></span></div>")
echo $htmlNode
```

## XML parser and pretty printer

```nim
let xmlNode = $parseXml("<tag id="123" bar="the thing"><foo>here</foo><foo2></foo2></tag>")
echo $xmlNode
```
