import strutils

type
  TaggyCtx* = object
    sayStack: seq[string]

var
  taggyCtx {.threadvar.}: TaggyCtx

proc newTaggy(): TaggyCtx =
  TaggyCtx(sayStack: @[""])

template render(inner: untyped): string =
  taggyCtx = newTaggy()
  inner
  let result = taggyCtx.sayStack.join("")
  result

template say(text: string) =
  taggyCtx.sayStack.add(text)

template span(inner: untyped) =
  taggyCtx.sayStack.add("<span>")
  inner
  taggyCtx.sayStack.add("</span>")

proc header() =
  say "<!DOCTYPE html>"

proc footer() =
  say "copyright 2026"

let f = render:
  header()
  span:
    say "Hello, world!"
  say "Hello, world!"
  footer()

echo f
