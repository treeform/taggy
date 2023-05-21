import taggy

var x = ""

x = render:
  span "#mainSpan":
    say "Hello world"
echo x

x = render:
  meta:
    attrProperty "og:title"
    attrContent "The Art Button"
echo x

x = render:
  tdiv:
    style:
      height 123
      backgroundColor "red"
    say "A"
  tdiv:
    style:
      height 100
    say "B"
echo x

x = render:
  styleSheet:
    css "#header":
      position "absolute"
      height 48
      left 0
      right 0
      top 0
echo x

x = render:
  styleSheet:
    css ".tab":
      marginRight 0
      css "&:last":
        marginRight 0
echo x

x = render:
  html:
    head:
      title:
        say "simple page"
      styleSheet:
        css "body":
          backgroundColor "back"
          color "white"
    body:
      h1:
        say "This is a simple page"
      p:
        say "Taggly allows server and client site html generation"
echo x
