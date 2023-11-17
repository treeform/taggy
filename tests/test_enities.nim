import taggy/entities

block:
  # Basic encoding:
  doAssert encodeHtmlEntities("test") == "test"
  doAssert encodeHtmlEntities("can't") == "can&apos;t"
  doAssert encodeHtmlEntities("foo & bar") == "foo &amp; bar"
  doAssert encodeHtmlEntities("Say \"hello\"") == "Say &quot;hello&quot;"
  doAssert encodeHtmlEntities("foo < bar") == "foo &lt; bar"
  doAssert encodeHtmlEntities("foo > bar") == "foo &gt; bar"
  doAssert encodeHtmlEntities("¼ of a cup") == "&frac14; of a cup"

  # Numbers:
  doAssert encodeHtmlEntities("\x1F") == "&#31;"
  doAssert encodeHtmlEntities("\31") == "&#31;"
  doAssert encodeHtmlEntities("\u1F") == "&#31;"

  doAssert encodeHtmlEntities("\u8080") == "&#32896;"
  doAssert encodeHtmlEntities("\xF4\x8F\xBF\xBF") == "&#1114111;"

  # Super fancy quotes:
  doAssert encodeHtmlEntities("the “foo” here") == "the &#8220;foo&#8221; here"

block:
  # Basic decoding:
  doAssert decodeHtmlEntities("test") == "test"
  doAssert decodeHtmlEntities("can&apos;t") == "can't"
  doAssert decodeHtmlEntities("foo &amp; bar") == "foo & bar"
  doAssert decodeHtmlEntities("Say &quot;hello&quot;") == "Say \"hello\""
  doAssert decodeHtmlEntities("foo &lt; bar") == "foo < bar"
  doAssert decodeHtmlEntities("foo &gt; bar") == "foo > bar"
  doAssert decodeHtmlEntities("&frac14; of a cup") == "¼ of a cup"

  # Numbers:
  doAssert decodeHtmlEntities("&#31;") == "\x1F"
  doAssert decodeHtmlEntities("&#31;") == "\31"
  doAssert decodeHtmlEntities("&#31;") == "\u1F"

  doAssert decodeHtmlEntities("&#x1F;") == "\x1F"
  doAssert decodeHtmlEntities("&#x1F;") == "\31"
  doAssert decodeHtmlEntities("&#x1F;") == "\u1F"

  doAssert decodeHtmlEntities("&#x8080;") == "\u8080"
  doAssert decodeHtmlEntities("&#xFFFE;") == "\uFFFE"
  # doAssert decodeHtmlEntities("&#x10FFFF") == "\u10FFFF" # Nim bug?
  doAssert decodeHtmlEntities("&#x10FFFF;") == "\xF4\x8F\xBF\xBF"

  # Super fancy quotes:
  doAssert decodeHtmlEntities("the &#8220;foo&#8221; here") == "the “foo” here"
