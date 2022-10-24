import taggy

block:
  var x = render:
    span "#mainSpan":
      say "Hello world"
  doAssert x == r"""<!DOCTYPE html><span id="mainSpan">Hello world</span>"""

block:
  var x = render:
    meta:
      attrProperty "og:title"
      attrContent "Right here"
  doAssert x == r"""<!DOCTYPE html><meta property="og:title" content="Right here"></meta>"""

block:
  var x = render:
    tdiv:
      style:
        height 123
        backgroundColor "red"
      say "A"
    tdiv:
      style:
        height 100
      say "B"
  doAssert x == r"""<!DOCTYPE html><div style="height: 123px;background-color: red;">A</div><div style="height: 100px;">B</div>"""

block:
  var x = render:
    styleSheet:
      css "#header":
        position "absolute"
        height 48
        left 0
        right 0
        top 0
  doAssert x == r"""<!DOCTYPE html><style>#header {position: absolute;height: 48px;left: 0px;right: 0px;top: 0px;}
</style>"""

block:
  var x = render:
    styleSheet:
      css ".tab":
        marginRight 0
        css "&:last":
          marginRight 0
  doAssert x == r"""<!DOCTYPE html><style>.tab {margin-right: 0px;}
.tab:last {margin-right: 0px;}
</style>"""
