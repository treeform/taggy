import std/unicode, std/tables, std/strutils

var runeToEntity = {
  # Inside the 32-126 ASCII range.
  34: "&quot;",
  38: "&amp;",
  39: "&apos;",
  60: "&lt;",
  62: "&gt;",
  # ISO-8859-1 and Windows-1252
  128: "&euro;",
  130: "&sbquo;",
  131: "&fnof;",
  132: "&bdquo;",
  133: "&hellip;",
  134: "&dagger;",
  135: "&Dagger;",
  136: "&circ;",
  137: "&permil;",
  138: "&Scaron;",
  139: "&lsaquo;",
  140: "&OElig;",
  142: "&Zcaron;",
  145: "&lsquo;",
  146: "&rsquo;",
  147: "&ldquo;",
  148: "&rdquo;",
  149: "&bull;",
  150: "&ndash",
  151: "&mdash",
  152: "&tilde",
  153: "&trade",
  154: "&scaron",
  155: "&rsaquo",
  156: "&oelig",
  158: "&zcaron",
  159: "&Yuml",
  # ISO-8859-1 Symbols
  160: "&nbsp;",
  161: "&iexcl;",
  162: "&cent;",
  163: "&pound;",
  164: "&curren;",
  165: "&yen;",
  166: "&brvbar;",
  167: "&sect;",
  168: "&uml;",
  169: "&copy;",
  170: "&ordf;",
  171: "&laquo;",
  172: "&not;",
  173: "&shy;",
  174: "&reg;",
  175: "&macr;",
  176: "&deg;",
  177: "&plusmn;",
  178: "&sup2;",
  179: "&sup3;",
  180: "&acute;",
  181: "&micro;",
  182: "&para;",
  183: "&middot;",
  184: "&cedil;",
  185: "&sup1;",
  186: "&ordm;",
  187: "&raquo;",
  188: "&frac14;",
  189: "&frac12;",
  190: "&frac34;",
  191: "&iquest;",
  # ISO-8859-1 Characters
  192: "&Agrave;",
  193: "&Aacute;",
  194: "&Acirc;",
  195: "&Atilde;",
  196: "&Auml;",
  197: "&Aring;",
  198: "&AElig;",
  199: "&Ccedil;",
  200: "&Egrave;",
  201: "&Eacute;",
  202: "&Ecirc;",
  203: "&Euml;",
  204: "&Igrave;",
  205: "&Iacute;",
  206: "&Icirc;",
  207: "&Iuml;",
  208: "&ETH;",
  209: "&Ntilde;",
  210: "&Ograve;",
  211: "&Oacute;",
  212: "&Ocirc;",
  213: "&Otilde;",
  214: "&Ouml;",
  215: "&times;",
  216: "&Oslash;",
  217: "&Ugrave;",
  218: "&Uacute;",
  219: "&Ucirc;",
  220: "&Uuml;",
  221: "&Yacute;",
  222: "&THORN;",
  223: "&szlig;",
  224: "&agrave;",
  225: "&aacute;",
  226: "&acirc;",
  227: "&atilde;",
  228: "&auml;",
  229: "&aring;",
  230: "&aelig;",
  231: "&ccedil;",
  232: "&egrave;",
  233: "&eacute;",
  234: "&ecirc;",
  235: "&euml;",
  236: "&igrave;",
  237: "&iacute;",
  238: "&icirc;",
  239: "&iuml;",
  240: "&eth;",
  241: "&ntilde;",
  242: "&ograve;",
  243: "&oacute;",
  244: "&ocirc;",
  245: "&otilde;",
  246: "&ouml;",
  247: "&divide;",
  248: "&oslash;",
  249: "&ugrave;",
  250: "&uacute;",
  251: "&ucirc;",
  252: "&uuml;",
  253: "&yacute;",
  254: "&thorn;",
  255: "&yuml;",
}.toTable

var entityToRune: Table[string, string]
for k, v in runeToEntity:
  entityToRune[v[1..^2]] = $Rune(k)

proc encodeHtmlEntities*(s: string): string =
  ## Encode HTML entities.
  for r in s.runes:
    if r.int32 in runeToEntity:
      result.add runeToEntity[r.int32]
    elif r.int32 < 32 or r.int32 > 126:
      result.add "&#" & $r.int32 & ";"
    else:
      result.add r

proc decodeHtmlEntities*(s: string): string =
  ## Decode HTML entities.
  var i = 0
  while i < s.len:
    if s[i] == '&':
      var j = i + 1
      while j < s.len and s[j] != ';':
        inc j
      let entity = s[i + 1 ..< j]
      if entity[0] == '#':
        if entity[1] == 'x':
          result.add entity[2 .. ^1].parseHexInt().Rune
        else:
          result.add entity[1 .. ^1].parseInt().Rune
      else:
        result.add entityToRune[entity]
      i = j + 1
    else:
      result.add s[i]
      inc i
