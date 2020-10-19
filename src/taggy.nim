import dom

var
  tagStack: seq[Node]           ## Nodes stack to know the parent nodes.
  lastNode: Node                ## Last node to be returned by generate.
  tagName: cstring              ## Current tag name.
  event*: Event                 ## Current global event used in event handlers.

template generate*(body: untyped): Node =
  ## Call this with taggy functions inside to get an HTML node back.
  ## This node can be attached to document.body or anywhere else.
  lastNode = nil
  body
  assert tagStack.len == 0
  lastNode

proc addNode(node: Node) =
  ## Adds a node to the tags.
  if tagStack.len > 0:
    tagStack[^1].appendChild(node)

proc openTag(name: cstring) =
  tagName = name
  let node = document.createElement(name)
  addNode(node)
  tagStack.add(node)

proc closeTag() =
  tagName = nil
  lastNode = tagStack.pop()

proc text*(s: cstring) =
  ## Use this to output textNode into the HTML.
  lastNode = document.createTextNode(s)
  addNode(lastNode)

# HTML Tags.

template tag*(name: cstring, body) =
  ## Creates a generic tag.
  openTag(name)
  body
  closeTag()

template a*(body: untyped) = tag("a", body) ## The HTML <a> element (or anchor element), with its href attribute, creates a hyperlink to web pages, files, email addresses, locations in the same page, or anything else a URL can address.
template abbr*(body: untyped) = tag("abbr", body) ## The HTML Abbreviation element (<abbr>) represents an abbreviation or acronym; the optional title attribute can provide an expansion or description for the abbreviation.
template address*(body: untyped) = tag("address", body) ## The HTML <address> element indicates that the enclosed HTML provides contact information for a person or people, or for an organization.
template area*(body: untyped) = tag("area", body) ## The HTML <area> tag defines an area inside an image map that has predefined clickable areas. An image map allows geometric areas on an image to be associated with hypertext link.
template article*(body: untyped) = tag("article", body) ## The HTML <article> element represents a self-contained composition in a document, page, application, or site, which is intended to be independently distributable or reusable (e.g., in syndication).
template aside*(body: untyped) = tag("aside", body) ## The HTML <aside> element represents a portion of a document whose content is only indirectly related to the document's main content.
template audio*(body: untyped) = tag("audio", body) ## The HTML <audio> element is used to embed sound content in documents. It may contain one or more audio sources, represented using the src attribute or the <source> element: the browser will choose the most suitable one. It can also be the destination for streamed media, using a MediaStream.
template b*(body: untyped) = tag("b", body) ## The HTML Bring Attention To element (<b>) is used to draw the reader's attention to the element's contents, which are not otherwise granted special importance.
template base*(body: untyped) = tag("base", body) ## The HTML <base> element specifies the base URL to use for all relative URLs in a document.
template bdi*(body: untyped) = tag("bdi", body) ## The HTML Bidirectional Isolate element (<bdi>)  tells the browser's bidirectional algorithm to treat the text it contains in isolation from its surrounding text.
template bdo*(body: untyped) = tag("bdo", body) ## The HTML Bidirectional Text Override element (<bdo>) overrides the current directionality of text, so that the text within is rendered in a different direction.
template blockquote*(body: untyped) = tag("blockquote", body) ## The HTML <blockquote> Element (or HTML Block Quotation Element) indicates that the enclosed text is an extended quotation. Usually, this is rendered visually by indentation (see Notes for how to change it). A URL for the source of the quotation may be given using the cite attribute, while a text representation of the source can be given using the <cite> element.
template body*(body: untyped) = tag("body", body) ## The HTML <body> Element represents the content of an HTML document. There can be only one <body> element in a document.
template br*(body: untyped) = tag("br", body) ## The HTML <br> element produces a line break in text (carriage-return). It is useful for writing a poem or an address, where the division of lines is significant.
template button*(body: untyped) = tag("button", body) ## The HTML <button> element represents a clickable button, used to submit forms or anywhere in a document for accessible, standard button functionality.
template canvas*(body: untyped) = tag("canvas", body) ## Use the HTML <canvas> element with either the canvas scripting API or the WebGL API to draw graphics and animations.
template caption*(body: untyped) = tag("caption", body) ## The HTML <caption> element specifies the caption (or title) of a table.
template cite*(body: untyped) = tag("cite", body) ## The HTML Citation element (<cite>) is used to describe a reference to a cited creative work, and must include the title of that work.
template code*(body: untyped) = tag("code", body) ## The HTML <code> element displays its contents styled in a fashion intended to indicate that the text is a short fragment of computer code.
template col*(body: untyped) = tag("col", body) ## The HTML <col> element defines a column within a table and is used for defining common semantics on all common cells. It is generally found within a <colgroup> element.
template colgroup*(body: untyped) = tag("colgroup", body) ## The HTML <colgroup> element defines a group of columns within a table.
template data*(body: untyped) = tag("data", body) ## The HTML <data> element links a given piece of content with a machine-readable translation. If the content is time- or date-related, the <time> element must be used.
template datalist*(body: untyped) = tag("datalist", body) ## The HTML <datalist> element contains a set of <option> elements that represent the permissible or recommended options available to choose from within other controls.
template dd*(body: untyped) = tag("dd", body) ## The HTML <dd> element provides the description, definition, or value for the preceding term (<dt>) in a description list (<dl>).
template del*(body: untyped) = tag("del", body) ## The HTML <del> element represents a range of text that has been deleted from a document.
template details*(body: untyped) = tag("details", body) ## The HTML Details Element (<details>) creates a disclosure widget in which information is visible only when the widget is toggled into an "open" state.
template dfn*(body: untyped) = tag("dfn", body) ## The HTML Definition element (<dfn>) is used to indicate the term being defined within the context of a definition phrase or sentence.
template dialog*(body: untyped) = tag("dialog", body) ## The HTML <dialog> element represents a dialog box or other interactive component, such as a dismissable alert, inspector, or subwindow.
template tdiv*(body: untyped) = tag("div", body) ## The HTML Content Division element (<div>) is the generic container for flow content. It has no effect on the content or layout until styled using CSS.
template dl*(body: untyped) = tag("dl", body) ## The HTML <dl> element represents a description list. The element encloses a list of groups of terms (specified using the <dt> element) and descriptions (provided by <dd> elements). Common uses for this element are to implement a glossary or to display metadata (a list of key-value pairs).
template dt*(body: untyped) = tag("dt", body) ## The HTML <dt> element specifies a term in a description or definition list, and as such must be used inside a <dl> element.
template em*(body: untyped) = tag("em", body) ## The HTML <em> element marks text that has stress emphasis. The <em> element can be nested, with each level of nesting indicating a greater degree of emphasis.
template embed*(body: untyped) = tag("embed", body) ## The HTML <embed> element embeds external content at the specified point in the document. This content is provided by an external application or other source of interactive content such as a browser plug-in.
template fieldset*(body: untyped) = tag("fieldset", body) ## The HTML <fieldset> element is used to group several controls as well as labels (<label>) within a web form.
template figcaption*(body: untyped) = tag("figcaption", body) ## The HTML <figcaption> or Figure Caption element represents a caption or legend describing the rest of the contents of its parent <figure> element.
template figure*(body: untyped) = tag("figure", body) ## The HTML <figure> (Figure With Optional Caption) element represents self-contained content, potentially with an optional caption, which is specified using the (<figcaption>) element.
template footer*(body: untyped) = tag("footer", body) ## The HTML <footer> element represents a footer for its nearest sectioning content or sectioning root element. A footer typically contains information about the author of the section, copyright data or links to related documents.
template form*(body: untyped) = tag("form", body) ## The HTML <form> element represents a document section containing interactive controls for submitting information.
template head*(body: untyped) = tag("head", body) ## The HTML <head> element contains machine-readable information (metadata) about the document, like its title, scripts, and style sheets.
template header*(body: untyped) = tag("header", body) ## The HTML <header> element represents introductory content, typically a group of introductory or navigational aids. It may contain some heading elements but also a logo, a search form, an author name, and other elements.
template hgroup*(body: untyped) = tag("hgroup", body) ## The HTML <hgroup> element represents a multi-level heading for a section of a document. It groups a set of <h1>–<h6> elements.
template h1*(body: untyped) = tag("h1", body) ## The HTML <h1>–<h6> elements represent six levels of section headings.
template h2*(body: untyped) = tag("h2", body) ## The HTML <h1>–<h6> elements represent six levels of section headings.
template h3*(body: untyped) = tag("h3", body) ## The HTML <h1>–<h6> elements represent six levels of section headings.
template h4*(body: untyped) = tag("h4", body) ## The HTML <h1>–<h6> elements represent six levels of section headings.
template h5*(body: untyped) = tag("h5", body) ## The HTML <h1>–<h6> elements represent six levels of section headings.
template h6*(body: untyped) = tag("h6", body) ## The HTML <h1>–<h6> elements represent six levels of section headings.
template hr*(body: untyped) = tag("hr", body) ## The HTML <hr> element represents a thematic break between paragraph-level elements: for example, a change of scene in a story, or a shift of topic within a section.
template i*(body: untyped) = tag("i", body) ## The HTML Idiomatic Text element (<i>) represents a range of text that is set off from the normal text for some reason, such as idiomatic text, technical terms, taxonomical designations, among others.
template iframe*(body: untyped) = tag("iframe", body) ## The HTML Inline Frame element (<iframe>) represents a nested browsing context, embedding another HTML page into the current one.
template img*(body: untyped) = tag("img", body) ## The HTML <img> element embeds an image into the document.
template input*(body: untyped) = tag("input", body) ## The HTML <input> element is used to create interactive controls for web-based forms in order to accept data from the user; a wide variety of types of input data and control widgets are available, depending on the device and user agent.
template ins*(body: untyped) = tag("ins", body) ## The HTML <ins> element represents a range of text that has been added to a document.
template kbd*(body: untyped) = tag("kbd", body) ## The HTML Keyboard Input element (<kbd>) represents a span of inline text denoting textual user input from a keyboard, voice input, or any other text entry device.
template label*(body: untyped) = tag("label", body) ## The HTML <label> element represents a caption for an item in a user interface.
template legend*(body: untyped) = tag("legend", body) ## The HTML <legend> element represents a caption for the content of its parent <fieldset>.
template li*(body: untyped) = tag("li", body) ## The HTML <li> element is used to represent an item in a list.
template link*(body: untyped) = tag("link", body) ## The HTML External Resource Link element (<link>) specifies relationships between the current document and an external resource. This element is most commonly used to link to stylesheets, but is also used to establish site icons (both "favicon" style icons and icons for the home screen and apps on mobile devices) among other things.
template main*(body: untyped) = tag("main", body) ## The HTML <main> element represents the dominant content of the <body> of a document. The main content area consists of content that is directly related to or expands upon the central topic of a document, or the central functionality of an application.
template main*(body: untyped) = tag("main", body) ## The HTML <main> element represents the dominant content of the <body> of a document. The main content area consists of content that is directly related to or expands upon the central topic of a document, or the central functionality of an application.
template map*(body: untyped) = tag("map", body) ## The HTML <map> element is used with <area> elements to define an image map (a clickable link area).
template mark*(body: untyped) = tag("mark", body) ## The HTML Mark Text element (<mark>) represents text which is marked or highlighted for reference or notation purposes, due to the marked passage's relevance or importance in the enclosing context.
template menu*(body: untyped) = tag("menu", body) ## The HTML <menu> element represents a group of commands that a user can perform or activate. This includes both list menus, which might appear across the top of a screen, as well as context menus, such as those that might appear underneath a button after it has been clicked.
template meta*(body: untyped) = tag("meta", body) ## The HTML <meta> element represents metadata that cannot be represented by other HTML meta-related elements, like <base>, <link>, <script>, <style> or <title>.
template meter*(body: untyped) = tag("meter", body) ## The HTML <meter> element represents either a scalar value within a known range or a fractional value.
template nav*(body: untyped) = tag("nav", body) ## The HTML <nav> element represents a section of a page whose purpose is to provide navigation links, either within the current document or to other documents. Common examples of navigation sections are menus, tables of contents, and indexes.
template noscript*(body: untyped) = tag("noscript", body) ## The HTML <noscript> element defines a section of HTML to be inserted if a script type on the page is unsupported or if scripting is currently turned off in the browser.
template tobject*(body: untyped) = tag("object", body) ## The HTML <object> element represents an external resource, which can be treated as an image, a nested browsing context, or a resource to be handled by a plugin.
template ol*(body: untyped) = tag("ol", body) ## The HTML <ol> element represents an ordered list of items — typically rendered as a numbered list.
template optgroup*(body: untyped) = tag("optgroup", body) ## The HTML <optgroup> element creates a grouping of options within a <select> element.
template option*(body: untyped) = tag("option", body) ## The HTML <option> element is used to define an item contained in a <select>, an <optgroup>, or a <datalist> element. As such, <option> can represent menu items in popups and other lists of items in an HTML document.
template output*(body: untyped) = tag("output", body) ## The HTML Output element (<output>) is a container element into which a site or app can inject the results of a calculation or the outcome of a user action.
template p*(body: untyped) = tag("p", body) ## The HTML <p> element represents a paragraph.
template param*(body: untyped) = tag("param", body) ## The HTML <param> element defines parameters for an <object> element.
template picture*(body: untyped) = tag("picture", body) ## The HTML <picture> element contains zero or more <source> elements and one <img> element to offer alternative versions of an image for different display/device scenarios.
template pre*(body: untyped) = tag("pre", body) ## The HTML <pre> element represents preformatted text which is to be presented exactly as written in the HTML file.
template progress*(body: untyped) = tag("progress", body) ## The HTML <progress> element displays an indicator showing the completion progress of a task, typically displayed as a progress bar.
template q*(body: untyped) = tag("q", body) ## The HTML <q> element indicates that the enclosed text is a short inline quotation. Most modern browsers implement this by surrounding the text in quotation marks.
template rb*(body: untyped) = tag("rb", body) ## The HTML Ruby Base (<rb>) element is used to delimit the base text component of a  <ruby> annotation, i.e. the text that is being annotated.
template rp*(body: untyped) = tag("rp", body) ## The HTML Ruby Fallback Parenthesis (<rp>) element is used to provide fall-back parentheses for browsers that do not support display of ruby annotations using the <ruby> element.
template rt*(body: untyped) = tag("rt", body) ## The HTML Ruby Text (<rt>) element specifies the ruby text component of a ruby annotation, which is used to provide pronunciation, translation, or transliteration information for East Asian typography. The <rt> element must always be contained within a <ruby> element.
template rtc*(body: untyped) = tag("rtc", body) ## The HTML Ruby Text Container (<rtc>) element embraces semantic annotations of characters presented in a ruby of <rb> elements used inside of <ruby> element. <rb> elements can have both pronunciation (<rt>) and semantic (<rtc>) annotations.
template ruby*(body: untyped) = tag("ruby", body) ## The HTML <ruby> element represents small annotations that are rendered above, below, or next to base text, usually used for showing the pronunciation of East Asian characters. It can also be used for annotating other kinds of text, but this usage is less common.
template s*(body: untyped) = tag("s", body) ## The HTML <s> element renders text with a strikethrough, or a line through it. Use the <s> element to represent things that are no longer relevant or no longer accurate. However, <s> is not appropriate when indicating document edits; for that, use the <del> and <ins> elements, as appropriate.
template samp*(body: untyped) = tag("samp", body) ## The HTML Sample Element (<samp>) is used to enclose inline text which represents sample (or quoted) output from a computer program.
template script*(body: untyped) = tag("script", body) ## The HTML <script> element is used to embed executable code or data; this is typically used to embed or refer to JavaScript code.
template section*(body: untyped) = tag("section", body) ## The HTML <section> element represents a standalone section — which doesn't have a more specific semantic element to represent it — contained within an HTML document.
template select*(body: untyped) = tag("select", body) ## The HTML <select> element represents a control that provides a menu of options
template slot*(body: untyped) = tag("slot", body) ## The HTML <slot> element—part of the Web Components technology suite—is a placeholder inside a web component that you can fill with your own markup, which lets you create separate DOM trees and present them together.
template small*(body: untyped) = tag("small", body) ## The HTML <small> element represents side-comments and small print, like copyright and legal text, independent of its styled presentation. By default, it renders text within it one font-size smaller, such as from small to x-small.
template source*(body: untyped) = tag("source", body) ## The HTML <source> element specifies multiple media resources for the <picture>, the <audio> element, or the <video> element.
template span*(body: untyped) = tag("span", body) ## The HTML <span> element is a generic inline container for phrasing content, which does not inherently represent anything. It can be used to group elements for styling purposes (using the class or id attributes), or because they share attribute values, such as lang.
template strong*(body: untyped) = tag("strong", body) ## The HTML Strong Importance Element (<strong>) indicates that its contents have strong importance, seriousness, or urgency. Browsers typically render the contents in bold type.
template style*(body: untyped) = tag("style", body) ## The HTML <style> element contains style information for a document, or part of a document.
template sub*(body: untyped) = tag("sub", body) ## The HTML Subscript element (<sub>) specifies inline text which should be displayed as subscript for solely typographical reasons.
template summary*(body: untyped) = tag("summary", body) ## The HTML Disclosure Summary element (<summary>) element specifies a summary, caption, or legend for a <details> element's disclosure box.
template sup*(body: untyped) = tag("sup", body) ## The HTML Superscript element (<sup>) specifies inline text which is to be displayed as superscript for solely typographical reasons.
template table*(body: untyped) = tag("table", body) ## The HTML <table> element represents tabular data — that is, information presented in a two-dimensional table comprised of rows and columns of cells containing data.
template tbody*(body: untyped) = tag("tbody", body) ## The HTML Table Body element (<body>) encapsulates a set of table rows (<tr> elements), indicating that they comprise the body of the table (<table>).
template td*(body: untyped) = tag("td", body) ## The HTML <td> element defines a cell of a table that contains data. It participates in the table model.
template ttemplate*(body: untyped) = tag("template", body) ## The HTML Content Template (<template>) element is a mechanism for holding HTML that is not to be rendered immediately when a page is loaded but may be instantiated subsequently during runtime using JavaScript.
template textarea*(body: untyped) = tag("textarea", body) ## The HTML <textarea> element represents a multi-line plain-text editing control, useful when you want to allow users to enter a sizeable amount of free-form text, for example a comment on a review or feedback form.
template tfoot*(body: untyped) = tag("tfoot", body) ## The HTML <foot> element defines a set of rows summarizing the columns of the table.
template th*(body: untyped) = tag("th", body) ## The HTML <th> element defines a cell as header of a group of table cells. The exact nature of this group is defined by the scope and headers attributes.
template thead*(body: untyped) = tag("thead", body) ## The HTML <head> element defines a set of rows defining the head of the columns of the table.
template time*(body: untyped) = tag("time", body) ## The HTML <time> element represents a specific period in time.
template title*(body: untyped) = tag("title", body) ## The HTML Title element (<title>) defines the document's title that is shown in a browser's title bar or a page's tab.
template tr*(body: untyped) = tag("tr", body) ## The HTML <tr> element defines a row of cells in a table. The row's cells can then be established using a mix of <td> (data cell) and <th> (header cell) elements.
template track*(body: untyped) = tag("track", body) ## The HTML <track> element is used as a child of the media elements, <audio> and <video>. It lets you specify timed text tracks (or time-based data), for example to automatically handle subtitles.
template u*(body: untyped) = tag("u", body) ## The HTML Unarticulated Annotation element (<u>) represents a span of inline text which should be rendered in a way that indicates that it has a non-textual annotation.
template ul*(body: untyped) = tag("ul", body) ## The HTML <ul> element represents an unordered list of items, typically rendered as a bulleted list.
template tvar*(body: untyped) = tag("var", body) ## The HTML Variable element (<var>) represents the name of a variable in a mathematical expression or a programming context.
template video*(body: untyped) = tag("video", body) ## The HTML Video element (<video>) embeds a media player which supports video playback into the document. You can use <video> for audio content as well, but the <audio> element may provide a more appropriate user experience.
template wbr*(body: untyped) = tag("wbr", body) ## The HTML <wbr> element represents a word break opportunity—a position within text where the browser may optionally break a line, though its line-breaking rules would not otherwise create a break at that location.

# Tag attributes.

proc setAttribute*(name: cstring, s: cstring) =
  ## Sets a generic attribute.
  var node = tagStack[^1]
  node.setAttribute(name, s)

template allowedOnTag*(allowedTags: openarray[string]) =
  ## Checks to see if current property is allowed on this tag.
  assert $tagName in allowedTags

proc accept*(s: cstring) = setAttribute("accept", s); allowedOnTag(["form", "input"]) ## List of types the server accepts, typically a file type.
proc acceptCharset*(s: cstring) = setAttribute("accept-charset", s); allowedOnTag(["form"]) ## List of supported charsets.
proc accesskey*(s: cstring) = setAttribute("accesskey", s) ## Keyboard shortcut to activate or add focus to the element.
proc action*(s: cstring) = setAttribute("action", s); allowedOnTag(["form"]) ## The URI of a program that processes the information submitted via the form.
proc align*(s: cstring) = setAttribute("align", s); allowedOnTag(["applet", "caption", "col", "colgroup", "hr", "iframe", "img", "table", "tbody", "td", "tfoot" , "th", "thead", "tr"]) ## Specifies the horizontal alignment of the element.
proc allow*(s: cstring) = setAttribute("allow", s); allowedOnTag(["iframe"]) ## Specifies a feature-policy for the iframe.
proc alt*(s: cstring) = setAttribute("alt", s); allowedOnTag(["applet", "area", "img", "input"]) ## Alternative text in case an image can't be displayed.
proc async*(s: cstring) = setAttribute("async", s); allowedOnTag(["script"]) ## Executes the script asynchronously.
proc autocapitalize*(s: cstring) = setAttribute("autocapitalize", s) ## Sets whether input is automatically capitalized when entered by user
proc autocomplete*(s: cstring) = setAttribute("autocomplete", s); allowedOnTag(["form", "input", "select", "textarea"]) ## Indicates whether controls in this form can by default have their values automatically completed by the browser.
proc autofocus*(s: cstring) = setAttribute("autofocus", s); allowedOnTag(["button", "input", "keygen", "select", "textarea"]) ## The element should be automatically focused after the page loaded.
proc autoplay*(s: cstring) = setAttribute("autoplay", s); allowedOnTag(["audio", "video"]) ## The audio or video should play as soon as possible.
proc background*(s: cstring) = setAttribute("background", s); allowedOnTag(["body", "table", "td", "th"]) ## Specifies the URL of an image file.
proc bgcolor*(s: cstring) = setAttribute("bgcolor", s); allowedOnTag(["body", "col", "colgroup", "marquee", "table", "tbody", "tfoot", "td", "th", "tr"]) ## "Background color of the element.
proc border*(s: cstring) = setAttribute("border", s); allowedOnTag(["img", "object", "table"]) ## "The border width.
proc buffered*(s: cstring) = setAttribute("buffered", s); allowedOnTag(["audio", "video"]) ## Contains the time range of already buffered media.
proc capture*(s: cstring) = setAttribute("capture", s); allowedOnTag(["input"]) ## "From the HTML Media Capture. The definition of 'media capture' in that specification.spec, specifies a new file can be captured."
proc challenge*(s: cstring) = setAttribute("challenge", s); allowedOnTag(["keygen"]) ## A challenge string that is submitted along with the public key.
proc charset*(s: cstring) = setAttribute("charset", s); allowedOnTag(["meta", "script"]) ## Declares the character encoding of the page or script.
proc checked*(s: cstring) = setAttribute("checked", s); allowedOnTag(["command", "input"]) ## Indicates whether the element should be checked on page load.
proc cite*(s: cstring) = setAttribute("cite", s); allowedOnTag(["blockquote", "del", "ins", "q"]) ## Contains a URI which points to the source of the quote or change.
proc class*(s: cstring) = setAttribute("class", s) ## Often used with CSS to style elements with common properties.
proc code*(s: cstring) = setAttribute("code", s); allowedOnTag(["applet"]) ## Specifies the URL of the applet's class file to be loaded and executed.
proc codebase*(s: cstring) = setAttribute("codebase", s); allowedOnTag(["applet"]) ## This attribute gives the absolute or relative URL of the directory where applets' .class files referenced by the code attribute are stored.
proc color*(s: cstring) = setAttribute("color", s); allowedOnTag(["basefont", "font", "hr"]) ## "This attribute sets the text color using either a named color or a color specified in the hexadecimal ]) ## RRGGBB format.
proc cols*(s: cstring) = setAttribute("cols", s); allowedOnTag(["textarea"]) ## Defines the number of columns in a textarea.
proc colspan*(s: cstring) = setAttribute("colspan", s); allowedOnTag(["td", "th"]) ## The colspan attribute defines the number of columns a cell should span.
proc content*(s: cstring) = setAttribute("content", s); allowedOnTag(["meta"]) ## A value associated with http-equiv or name depending on the context.
proc contenteditable*(s: cstring) = setAttribute("contenteditable", s) ## Indicates whether the element's content is editable.
proc contextmenu*(s: cstring) = setAttribute("contextmenu", s) ## Defines the ID of a "menu" element which will serve as the element's context menu.
proc controls*(s: cstring) = setAttribute("controls", s); allowedOnTag(["audio", "video"]) ## Indicates whether the browser should show playback controls to the user.
proc coords*(s: cstring) = setAttribute("coords", s); allowedOnTag(["area"]) ## A set of values specifying the coordinates of the hot-spot region.
proc crossorigin*(s: cstring) = setAttribute("crossorigin", s); allowedOnTag(["audio", "img", "link", "script", "video"]) ## How the element handles cross-origin requests
proc csp*(s: cstring) = setAttribute("csp", s); allowedOnTag(["iframe"]) ## Specifies the Content Security Policy that an embedded document must agree to enforce upon itself.
proc data*(s: cstring) = setAttribute("data", s); allowedOnTag(["object"]) ## Specifies the URL of the resource.
proc datetime*(s: cstring) = setAttribute("datetime", s); allowedOnTag(["del", "ins", "time"]) ## Indicates the date and time associated with the element.
proc decoding*(s: cstring) = setAttribute("decoding", s); allowedOnTag(["img"]) ## Indicates the preferred method to decode the image.
proc default*(s: cstring) = setAttribute("default", s); allowedOnTag(["track"]) ## Indicates that the track should be enabled unless the user's preferences indicate something different.
proc tdefer*(s: cstring) = setAttribute("tdefer", s); allowedOnTag(["script"]) ## Indicates that the script should be executed after the page has been parsed.
proc dir*(s: cstring) = setAttribute("dir", s) ## Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
proc dirname*(s: cstring) = setAttribute("dirname", s); allowedOnTag(["input", "textarea"]) ## Attribute is used to enable the text direction.
proc disabled*(s: cstring) = setAttribute("disabled", s); allowedOnTag(["button", "command", "fieldset", "input", "keygen", "optgroup", "option", "select", "textarea"]) ## Indicates whether the user can interact with the element.
proc download*(s: cstring) = setAttribute("download", s); allowedOnTag(["a", "area"]) ## Indicates that the hyperlink is to be used for downloading a resource.
proc draggable*(s: cstring) = setAttribute("draggable", s) ## Defines whether the element can be dragged.
proc dropzone*(s: cstring) = setAttribute("dropzone", s) ## Indicates that the element accepts the dropping of content onto it.
proc enctype*(s: cstring) = setAttribute("enctype", s); allowedOnTag(["form"]) ## Defines the content type of the form data when the method is POST.
proc enterkeyhint*(s: cstring) = setAttribute("enterkeyhint", s); allowedOnTag(["textarea"]) ## The enterkeyhint specifies what action label (or icon) to present for the enter key on virtual keyboards. The attribute can be used with form controls (such as the value of textarea elements), or in elements in an editing host (e.g., using contenteditable attribute).
proc tfor*(s: cstring) = setAttribute("tfor", s); allowedOnTag(["label", "output"]) ## Describes elements which belongs to this one.
proc form*(s: cstring) = setAttribute("form", s); allowedOnTag(["button", "fieldset", "input", "keygen", "label", "meter", "object", "output", "progress", "select", "textarea"]) ## Indicates the form that is the owner of the element.
proc formaction*(s: cstring) = setAttribute("formaction", s); allowedOnTag(["input", "button"]) ## Indicates the action of the element, overriding the action defined in the "form".
proc formenctype*(s: cstring) = setAttribute("formenctype", s); allowedOnTag(["button", "input"]) ## If the button/input is a submit button (type="submit"), this attribute sets the encoding type to use during form submission. If this attribute is specified, it overrides the enctype attribute of the button's form owner.
proc formmethod*(s: cstring) = setAttribute("formmethod", s); allowedOnTag(["button", "input"]) ## If the button/input is a submit button (type="submit"), this attribute sets the submission method to use during form submission (GET, POST, etc.). If this attribute is specified, it overrides the method attribute of the button's form owner.
proc formnovalidate*(s: cstring) = setAttribute("formnovalidate", s); allowedOnTag(["button", "input"]) ## If the button/input is a submit button (type="submit"), this boolean attribute specifies that the form is not to be validated when it is submitted. If this attribute is specified, it overrides the novalidate attribute of the button's form owner.
proc formtarget*(s: cstring) = setAttribute("formtarget", s); allowedOnTag(["button", "input"]) ## If the button/input is a submit button (type="submit"), this attribute specifies the browsing context (for example, tab, window, or inline frame) in which to display the response that is received after submitting the form. If this attribute is specified, it overrides the target attribute of the button's form owner.
proc headers*(s: cstring) = setAttribute("headers", s); allowedOnTag(["td", "th"]) ## IDs of the "th" elements which applies to this element.
proc height*(s: cstring) = setAttribute("height", s); allowedOnTag(["canvas", "embed", "iframe", "img", "input", "object", "video"]) ## "Specifies the height of elements listed here. For all other elements, use the CSS height property.
proc hidden*(s: cstring) = setAttribute("hidden", s) ## Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
proc high*(s: cstring) = setAttribute("high", s); allowedOnTag(["meter"]) ## Indicates the lower bound of the upper range.
proc href*(s: cstring) = setAttribute("href", s); allowedOnTag(["a", "area", "base", "link"]) ## The URL of a linked resource.
proc hreflang*(s: cstring) = setAttribute("hreflang", s); allowedOnTag(["a", "area", "link"]) ## Specifies the language of the linked resource.
proc httpEquiv*(s: cstring) = setAttribute("httpEquiv", s); allowedOnTag(["meta"]) ## Defines a pragma directive.
proc icon*(s: cstring) = setAttribute("icon", s); allowedOnTag(["command"]) ## Specifies a picture which represents the command.
proc id*(s: cstring) = setAttribute("id", s) ## Often used with CSS to style a specific element. The value of this attribute must be unique.
proc importance*(s: cstring) = setAttribute("importance", s); allowedOnTag(["iframe", "img", "link", "script"]) ## Indicates the relative fetch priority for the resource.
proc integrity*(s: cstring) = setAttribute("integrity", s); allowedOnTag(["link", "script"]) ## Specifies a Subresource Integrity value that allows browsers to verify what they fetch.
proc intrinsicsize*(s: cstring) = setAttribute("intrinsicsize", s); allowedOnTag(["img"]) ## This attribute tells the browser to ignore the actual intrinsic size of the image and pretend it’s the size specified in the attribute.
proc inputmode*(s: cstring) = setAttribute("inputmode", s); allowedOnTag(["textarea"]) ## Provides a hint as to the type of data that might be entered by the user while editing the element or its contents. The attribute can be used with form controls (such as the value of textarea elements), or in elements in an editing host (e.g., using contenteditable attribute).
proc ismap*(s: cstring) = setAttribute("ismap", s); allowedOnTag(["img"]) ## Indicates that the image is part of a server-side image map.
proc itemprop*(s: cstring) = setAttribute("itemprop", s) ## Global attribute is used to add properties to an item.
proc keytype*(s: cstring) = setAttribute("keytype", s); allowedOnTag(["keygen"]) ## Specifies the type of key generated.
proc kind*(s: cstring) = setAttribute("kind", s); allowedOnTag(["track"]) ## Specifies the kind of text track.
proc label*(s: cstring) = setAttribute("label", s); allowedOnTag(["optgroup", "option", "track"]) ## Specifies a user-readable title of the element.
proc lang*(s: cstring) = setAttribute("lang", s) ## Defines the language used in the element.
proc language*(s: cstring) = setAttribute("language", s); allowedOnTag(["script"]) ## Defines the script language used in the element.
proc loading*(s: cstring) = setAttribute("loading", s); allowedOnTag(["img", "iframe"]) ## Indicates if the element should be loaded lazily (loading="lazy") or loaded immediately (loading="eager").WIP: WHATWG PR ]) ## 3752
proc list*(s: cstring) = setAttribute("list", s); allowedOnTag(["input"]) ## Identifies a list of pre-defined options to suggest to the user.
proc loop*(s: cstring) = setAttribute("loop", s); allowedOnTag(["audio", "bgsound", "marquee", "video"]) ## Indicates whether the media should start playing from the start when it's finished.
proc low*(s: cstring) = setAttribute("low", s); allowedOnTag(["meter"]) ## Indicates the upper bound of the lower range.
proc manifest*(s: cstring) = setAttribute("manifest", s); allowedOnTag(["html"]) ## Specifies the URL of the document's cache manifest.max*(s: cstring) = setAttribute("src", s); allowedOnTag(["input", "meter", "progress"]) ## Indicates the maximum value allowed.
proc maxlength*(s: cstring) = setAttribute("maxlength", s); allowedOnTag(["input", "textarea"]) ## Defines the maximum number of characters allowed in the element.
proc minlength*(s: cstring) = setAttribute("minlength", s); allowedOnTag(["input", "textarea"]) ## Defines the minimum number of characters allowed in the element.
proc media*(s: cstring) = setAttribute("media", s); allowedOnTag(["a", "area", "link", "source", "style"]) ## Specifies a hint of the media for which the linked resource was designed.
proc tmethod*(s: cstring) = setAttribute("tmethod", s); allowedOnTag(["form"]) ## Defines which HTTP method to use when submitting the form. Can be GET (default) or POST.
proc min*(s: cstring) = setAttribute("min", s); allowedOnTag(["input", "meter"]) ## Indicates the minimum value allowed.
proc multiple*(s: cstring) = setAttribute("multiple", s); allowedOnTag(["input", "select"]) ## Indicates whether multiple values can be entered in an input of the type email or file.
proc muted*(s: cstring) = setAttribute("muted", s); allowedOnTag(["audio", "video"]) ## Indicates whether the audio will be initially silenced on page load.
proc name*(s: cstring) = setAttribute("name", s); allowedOnTag(["button", "form", "fieldset", "iframe", "input", "keygen", "object", "output", "select", "textarea", "map", "meta", "param"]) ## Name of the element. For example used by the server to identify the fields in form submits.
proc novalidate*(s: cstring) = setAttribute("novalidate", s); allowedOnTag(["form"]) ## This attribute indicates that the form shouldn't be validated when submitted.
proc open*(s: cstring) = setAttribute("open", s); allowedOnTag(["details"]) ## Indicates whether the details will be shown on page load.
proc optimum*(s: cstring) = setAttribute("optimum", s); allowedOnTag(["meter"]) ## Indicates the optimal numeric value.
proc pattern*(s: cstring) = setAttribute("pattern", s); allowedOnTag(["input"]) ## Defines a regular expression which the element's value will be validated against.
proc ping*(s: cstring) = setAttribute("ping", s); allowedOnTag(["a", "area"]) ## The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
proc placeholder*(s: cstring) = setAttribute("placeholder", s); allowedOnTag(["input", "textarea"]) ## Provides a hint to the user of what can be entered in the field.
proc poster*(s: cstring) = setAttribute("poster", s); allowedOnTag(["video"]) ## A URL indicating a poster frame to show until the user plays or seeks.
proc preload*(s: cstring) = setAttribute("preload", s); allowedOnTag(["audio", "video"]) ## Indicates whether the whole resource, parts of it or nothing should be preloaded.
proc readonly*(s: cstring) = setAttribute("readonly", s); allowedOnTag(["input", "textarea"]) ## Indicates whether the element can be edited.
proc referrerpolicy*(s: cstring) = setAttribute("referrerpolicy", s); allowedOnTag(["a", "area", "iframe", "img", "link", "script"]) ## Specifies which referrer is sent when fetching the resource.
proc rel*(s: cstring) = setAttribute("rel", s); allowedOnTag(["a", "area", "link"]) ## Specifies the relationship of the target object to the link object.
proc required*(s: cstring) = setAttribute("required", s); allowedOnTag(["input", "select", "textarea"]) ## Indicates whether this element is required to fill out or not.
proc reversed*(s: cstring) = setAttribute("reversed", s); allowedOnTag(["ol"]) ## Indicates whether the list should be displayed in a descending order instead of a ascending.
proc rows*(s: cstring) = setAttribute("rows", s); allowedOnTag(["textarea"]) ## Defines the number of rows in a text area.
proc rowspan*(s: cstring) = setAttribute("rowspan", s); allowedOnTag(["td", "th"]) ## Defines the number of rows a table cell should span over.
proc sandbox*(s: cstring) = setAttribute("sandbox", s); allowedOnTag(["iframe"]) ## Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
proc scope*(s: cstring) = setAttribute("scope", s); allowedOnTag(["th"]) ## Defines the cells that the header test (defined in the th element) relates to.
proc selected*(s: cstring) = setAttribute("selected", s); allowedOnTag(["option"]) ## Defines a value which will be selected on page load.
proc shape*(s: cstring) = setAttribute("shape", s); allowedOnTag(["a", "area"]) ## Use the shape attribute to specify the shape of each area in an image map.
proc size*(s: cstring) = setAttribute("size", s); allowedOnTag(["input", "select"]) ## Defines the width of the element (in pixels). If the element's type attribute is text or password then it's the number of characters.
proc sizes*(s: cstring) = setAttribute("sizes", s); allowedOnTag(["link", "img", "source"]) ## The size attribute specifies the visible width.
proc slot*(s: cstring) = setAttribute("slot", s) ## Assigns a slot in a shadow DOM shadow tree to an element.
proc span*(s: cstring) = setAttribute("span", s); allowedOnTag(["col", "colgroup"]) ## Defines the number of columns a <col>/<colgroup> element should span.
proc spellcheck*(s: cstring) = setAttribute("spellcheck", s) ## Indicates whether spell checking is allowed for the element.
proc src*(s: cstring) = setAttribute("src", s); allowedOnTag(["audio", "embed", "iframe", "img", "input", "script", "source", "track", "video"]) ## The URL of the embeddable content.
proc srcdoc*(s: cstring) = setAttribute("srcdoc", s); allowedOnTag(["iframe"]) ## Attribute specifies the HTML content of the page to show in the inline frame.
proc srclang*(s: cstring) = setAttribute("srclang", s); allowedOnTag(["track"]) ## The srclang attribute specifies the language of the track text data.
proc srcset*(s: cstring) = setAttribute("srcset", s); allowedOnTag(["img", "source"]) ## One or more responsive image candidates.
proc start*(s: cstring) = setAttribute("start", s); allowedOnTag(["ol"]) ## Defines the first number if other than 1.
proc step*(s: cstring) = setAttribute("step", s); allowedOnTag(["input"]) ## The step attribute specifies the interval between legal numbers in an <input> element.
proc style*(s: cstring) = setAttribute("style", s) ## Defines CSS styles which will override styles previously set.
proc summary*(s: cstring) = setAttribute("summary", s); allowedOnTag(["table"]) ## The summary attribute of the table element to give an overview of data tables.
proc tabindex*(s: cstring) = setAttribute("tabindex", s) ## Overrides the browser's default tab order and follows the one specified instead.
proc target*(s: cstring) = setAttribute("target", s); allowedOnTag(["a", "area", "base", "form"]) ## Specifies where to open the linked document (in the case of an "a" element) or where to display the response recieved (in the case of a "form" element)
proc title*(s: cstring) = setAttribute("title", s) ## Text to be displayed in a tooltip when hovering over the element.
proc translate*(s: cstring) = setAttribute("translate", s) ## Specify whether an element’s attribute values and the values of its Text node children are to be translated when the page is localized, or whether to leave them unchanged.
proc ttype*(s: cstring) = setAttribute("type", s); allowedOnTag(["button", "input", "command", "embed", "object", "script", "source", "style", "menu"]) ## Defines the type of the element.
proc usemap*(s: cstring) = setAttribute("usemap", s); allowedOnTag(["img", "input", "object"]) ## Specifies an image (or an object) as an image map (an image map is an image with clickable areas).
proc value*(s: cstring) = setAttribute("value", s); allowedOnTag(["button", "data", "input", "li", "meter", "option", "progress", "param"]) ## Defines a default value which will be displayed in the element on page load.
proc width*(s: cstring) = setAttribute("width", s); allowedOnTag(["canvas", "embed", "iframe", "img", "input", "object", "video"]) ## "For the elements listed here, this establishes the element's width.
proc wrap*(s: cstring) = setAttribute("wrap", s); allowedOnTag(["textarea"]) ## Indicates whether the text should be wrapped.

# Event handlers.

template onEvent*(name: cstring, body: untyped) =
  ## Sets a generic on event handler.
  proc `"handler" name`(thisEvent: Event) =
    event = thisEvent
    body
    event = nil
  tagStack[^1].addEventListener(name, `"handler" name`)

template onAbort*(body: untyped) = onEvent("abort", body) ## The loading of a media is aborted.
template onAfterPrint*(body: untyped) = onEvent("afterprint", body) ## A page has started printing, or if the print dialogue box has been closed.
template onAnimationEnd*(body: untyped) = onEvent("animationend", body) ## A CSS animation has completed.
template onAnimationIteration*(body: untyped) = onEvent("animationiteration", body) ## A CSS animation is repeated.
template onAnimationStart*(body: untyped) = onEvent("animationstart", body) ## A CSS animation has started.
template onBeforePrint*(body: untyped) = onEvent("beforeprint", body) ## A page is about to be printed.
template onBeforeUnload*(body: untyped) = onEvent("beforeunload", body) ## The event occurs before the document is about to be unloaded.
template onBlur*(body: untyped) = onEvent("blur", body) ## An element loses focus.
template onCanPlay*(body: untyped) = onEvent("canplay", body) ## The browser can start playing the media (when it has buffered enough to begin).
template onCanPlayThrough*(body: untyped) = onEvent("canplaythrough", body) ## The browser can play through the media without stopping for buffering.
template onChange*(body: untyped) = onEvent("change", body) ## The content of a form element, the selection, or the checked state have changed (for <input>, <select>, and <textarea>).
template onClick*(body: untyped) = onEvent("click", body) ## The user clicks on an element.
template onContextMenu*(body: untyped) = onEvent("contextmenu", body) ## The user right-clicks on an element to open a context menu.
template onCopy*(body: untyped) = onEvent("copy", body) ## The user copies the content of an element.
template onCut*(body: untyped) = onEvent("cut", body) ## The user cuts the content of an element.
template onDblClick*(body: untyped) = onEvent("dblclick", body) ## The user double-clicks on an element.
template onDrag*(body: untyped) = onEvent("drag", body) ## An element is being dragged.
template onDragEnd*(body: untyped) = onEvent("dragend", body) ## The user has finished dragging an element.
template onDragEnter*(body: untyped) = onEvent("dragenter", body) ## The dragged element enters the drop target.
template onDragLeave*(body: untyped) = onEvent("dragleave", body) ## The dragged element leaves the drop target.
template onDragOver*(body: untyped) = onEvent("dragover", body) ## The dragged element is over the drop target.
template onDragStart*(body: untyped) = onEvent("dragstart", body) ## The user starts to drag an element.
template onDrop*(body: untyped) = onEvent("drop", body) ## The dragged element is dropped on the drop target.
template onDurationChange*(body: untyped) = onEvent("durationchange", body) ## The duration of the media is changed.
template onEnded*(body: untyped) = onEvent("ended", body) ## The media has reach the end (useful for messages like "thanks for listening").
template onError*(body: untyped) = onEvent("error", body) ## An error occurs while loading an external file.
template onFocus*(body: untyped) = onEvent("focus", body) ## An element gets focus.
template onFocusIn*(body: untyped) = onEvent("focusin", body) ## An element is about to get focus.
template onFocusOut*(body: untyped) = onEvent("focusout", body) ## An element is about to lose focus.
template onFullscreenChange*(body: untyped) = onEvent("fullscreenchange", body) ## An element is displayed in fullscreen mode.
template onFullscreenError*(body: untyped) = onEvent("fullscreenerror", body) ## An element can not be displayed in fullscreen mode.
template onHashChange*(body: untyped) = onEvent("hashchange", body) ## There has been changes to the anchor part of a URL.
template onInput*(body: untyped) = onEvent("input", body) ## An element gets user input.
template onInvalid*(body: untyped) = onEvent("invalid", body) ## An element is invalid.
template onKeyDown*(body: untyped) = onEvent("keydown", body) ## The user is pressing a key.
template onKeyPress*(body: untyped) = onEvent("keypress", body) ## The user presses a key.
template onKeyUp*(body: untyped) = onEvent("keyup", body) ## The user releases a key.
template onLoad*(body: untyped) = onEvent("load", body) ## An object has loaded.
template onLoadedData*(body: untyped) = onEvent("loadeddata", body) ## Media data is loaded.
template onLoadedMetaData*(body: untyped) = onEvent("loadedmetadata", body) ## Meta data (like dimensions and duration) are loaded.
template onLoadStart*(body: untyped) = onEvent("loadstart", body) ## The browser starts looking for the specified media.
template onMessage*(body: untyped) = onEvent("message", body) ## A message is received through the event source.
template onMouseDown*(body: untyped) = onEvent("mousedown", body) ## The user presses a mouse button over an element.
template onMouseEnter*(body: untyped) = onEvent("mouseenter", body) ## The pointer is moved onto an element.
template onMouseLeave*(body: untyped) = onEvent("mouseleave", body) ## The pointer is moved out of an element.
template onMouseMove*(body: untyped) = onEvent("mousemove", body) ## The pointer is moving while it is over an element.
template onMouseOver*(body: untyped) = onEvent("mouseover", body) ## The pointer is moved onto an element, or onto one of its children.
template onMouseOut*(body: untyped) = onEvent("mouseout", body) ## A user moves the mouse pointer out of an element, or out of one of its children.
template onMouseUp*(body: untyped) = onEvent("mouseup", body) ## A user releases a mouse button over an element.
template onMouseWheel*(body: untyped) = onEvent("mousewheel", body) ## Deprecated. Use the wheel event instead.
template onOffline*(body: untyped) = onEvent("offline", body) ## The browser starts to work offline.
template onOnline*(body: untyped) = onEvent("online", body) ## The browser starts to work online.
template onOpen*(body: untyped) = onEvent("open", body) ## A connection with the event source is opened.
template onPageHide*(body: untyped) = onEvent("pagehide", body) ## The user navigates away from a webpage.
template onPageShow*(body: untyped) = onEvent("pageshow", body) ## The user navigates to a webpage.
template onPaste*(body: untyped) = onEvent("paste", body) ## The user pastes some content in an element.
template onPause*(body: untyped) = onEvent("pause", body) ## The media is paused either by the user or programmatically.
template onPlay*(body: untyped) = onEvent("play", body) ## The media has been started or is no longer paused.
template onPlaying*(body: untyped) = onEvent("playing", body) ## The media is playing after having been paused or stopped for buffering.
template onPopState*(body: untyped) = onEvent("popstate", body) ## The window's history changes.
template onProgress*(body: untyped) = onEvent("progress", body) ## The browser is in the process of getting the media data (downloading the media).
template onRateChange*(body: untyped) = onEvent("ratechange", body) ## The playing speed of the media is changed.
template onResize*(body: untyped) = onEvent("resize", body) ## The document view is resized.
template onReset*(body: untyped) = onEvent("reset", body) ## A form is reset.
template onScroll*(body: untyped) = onEvent("scroll", body) ## An element's scrollbar is being scrolled.
template onSearch*(body: untyped) = onEvent("search", body) ## The user writes something in a search field (for <input="search">).
template onSeeked*(body: untyped) = onEvent("seeked", body) ## The user is finished moving/skipping to a new position in the media.
template onSeeking*(body: untyped) = onEvent("seeking", body) ## The user starts moving/skipping to a new position in the media.
template onSelect*(body: untyped) = onEvent("select", body) ## The event occurs after the user selects some text (for <input> and <textarea>).
template onShow*(body: untyped) = onEvent("show", body) ## A <menu> element is shown as a context menu.
template onStalled*(body: untyped) = onEvent("stalled", body) ## The browser is trying to get media data, but data is not available.
template onStorage*(body: untyped) = onEvent("storage", body) ## A Web Storage area is updated.
template onSubmit*(body: untyped) = onEvent("submit", body) ## A form is submitted.
template onSuspend*(body: untyped) = onEvent("suspend", body) ## The browser is intentionally not getting media data.
template onTimeUpdate*(body: untyped) = onEvent("timeupdate", body) ## The playing position has changed (like when the user fast forwards to a different point in the media).
template onToggle*(body: untyped) = onEvent("toggle", body) ## The user opens or closes the <details> element.
template onTouchCancel*(body: untyped) = onEvent("touchcancel", body) ## The touch is interrupted.
template onTouchEnd*(body: untyped) = onEvent("touchend", body) ## A finger is removed from a touch screen.
template onTouchMove*(body: untyped) = onEvent("touchmove", body) ## A finger is dragged across the screen.
template onTouchStart*(body: untyped) = onEvent("touchstart", body) ## A finger is placed on a touch screen.
template onTransitionEnd*(body: untyped) = onEvent("transitionend", body) ## A CSS transition has completed.
template onUnload*(body: untyped) = onEvent("unload", body) ## The event occurs once a page has unloaded (for <body>).
template onVolumeChange*(body: untyped) = onEvent("volumechange", body) ## The volume of the media has changed (includes setting the volume to "mute").
template onWaiting*(body: untyped) = onEvent("waiting", body) ## The media has paused but is expected to resume (like when the media pauses to buffer more data).
template onWheel*(body: untyped) = onEvent("wheel", body) ## The mouse wheel rolls up or down over an element.

# Style Properties.

proc setStyle*(name: cstring, s: cstring) =
  ## Sets a generic style property.
  var node = tagStack[^1]
  {.emit: [node, ".style[", name, "] =", s, ";"].}

proc alignContent*(s: string) = setStyle("alignContent", s) ## The alignment between the lines inside a flexible container when the items do not use all available space*(s: string) = setStyle("space", s) ## 3
proc alignItems*(s: string) = setStyle("alignItems", s) ## The alignment for items inside a flexible container.
proc alignSelf*(s: string) = setStyle("alignSelf", s) ## The alignment for selected items inside a flexible container.
proc animation*(s: string) = setStyle("animation", s) ## A shorthand property for all the animation properties below, except the animationPlayState property.
proc animationDelay*(s: string) = setStyle("animationDelay", s) ## When the animation will start.
proc animationDirection*(s: string) = setStyle("animationDirection", s) ## Whether or not the animation should play in reverse on alternate cycles.
proc animationDuration*(s: string) = setStyle("animationDuration", s) ## How many seconds or milliseconds an animation takes to complete one cycle.
proc animationFillMode*(s: string) = setStyle("animationFillMode", s) ## What values are applied by the animation outside the time it is executing.
proc animationIterationCount*(s: string) = setStyle("animationIterationCount", s) ## The number of times an animation should be played.
proc animationName*(s: string) = setStyle("animationName", s) ## A name for the @keyframes animation.
proc animationTimingFunction*(s: string) = setStyle("animationTimingFunction", s) ## The speed curve of the animation.
proc animationPlayState*(s: string) = setStyle("animationPlayState", s) ## Whether the animation is running or paused.
proc background*(s: string) = setStyle("background", s) ## All the background properties in one declaration.
proc backgroundAttachment*(s: string) = setStyle("backgroundAttachment", s) ## Whether a background-image is fixed or scrolls with the page.
proc backgroundColor*(s: string) = setStyle("backgroundColor", s) ## The background-color of an element.
proc backgroundImage*(s: string) = setStyle("backgroundImage", s) ## The background-image for an element.
proc backgroundPosition*(s: string) = setStyle("backgroundPosition", s) ## The starting position of a background-image.
proc backgroundRepeat*(s: string) = setStyle("backgroundRepeat", s) ## How to repeat (tile) a background-image.
proc backgroundClip*(s: string) = setStyle("backgroundClip", s) ## The painting area of the background.
proc backgroundOrigin*(s: string) = setStyle("backgroundOrigin", s) ## The positioning area of the background images.
proc backgroundSize*(s: string) = setStyle("backgroundSize", s) ## The size of the background image.
proc backfaceVisibility*(s: string) = setStyle("backfaceVisibility", s) ## Whether or not an element should be visible when not facing the screen.
proc border*(s: string) = setStyle("border", s) ## BorderWidth, borderStyle, and borderColor in one declaration.
proc borderBottom*(s: string) = setStyle("borderBottom", s) ## All the borderBottom properties in one declaration.
proc borderBottomColor*(s: string) = setStyle("borderBottomColor", s) ## The color of the bottom border*(s: string) = setStyle("border", s) .
proc borderBottomLeftRadius*(s: string) = setStyle("borderBottomLeftRadius", s) ## The shape of the border of the bottom-left corner.
proc borderBottomRightRadius*(s: string) = setStyle("borderBottomRightRadius", s) ## The shape of the border of the bottom-right corner.
proc borderBottomStyle*(s: string) = setStyle("borderBottomStyle", s) ## The style of the bottom border.
proc borderBottomWidth*(s: string) = setStyle("borderBottomWidth", s) ## The width of the bottom border.
proc borderCollapse*(s: string) = setStyle("borderCollapse", s) ## Whether the table border should be collapsed into a single border, or not.
proc borderColor*(s: string) = setStyle("borderColor", s) ## The color of an element's border (can have up to four values).
proc borderImage*(s: string) = setStyle("borderImage", s) ## A shorthand property for setting or returning all the borderImage properties.
proc borderImageOutset*(s: string) = setStyle("borderImageOutset", s) ## The amount by which the border image area extends beyond the border box.
proc borderImageRepeat*(s: string) = setStyle("borderImageRepeat", s) ## Whether the image-border should be repeated, rounded or stretched.
proc borderImageSlice*(s: string) = setStyle("borderImageSlice", s) ## The inward offsets of the image-border.
proc borderImageSource*(s: string) = setStyle("borderImageSource", s) ## The image to be used as a border.
proc borderImageWidth*(s: string) = setStyle("borderImageWidth", s) ## The widths of the image-border.
proc borderLeft*(s: string) = setStyle("borderLeft", s) ## All the borderLeft properties in one declaration.
proc borderLeftColor*(s: string) = setStyle("borderLeftColor", s) ## The color of the left border.
proc borderLeftStyle*(s: string) = setStyle("borderLeftStyle", s) ## The style of the left border.
proc borderLeftWidth*(s: string) = setStyle("borderLeftWidth", s) ## The width of the left border.
proc borderRadius*(s: string) = setStyle("borderRadius", s) ## A shorthand property for setting or returning all the four borderRadius properties.
proc borderRight*(s: string) = setStyle("borderRight", s) ## All the borderRight properties in one declaration.
proc borderRightColor*(s: string) = setStyle("borderRightColor", s) ## The color of the right border.
proc borderRightStyle*(s: string) = setStyle("borderRightStyle", s) ## The style of the right border.
proc borderRightWidth*(s: string) = setStyle("borderRightWidth", s) ## The width of the right border.
proc borderSpacing*(s: string) = setStyle("borderSpacing", s) ## The space between cells in a table.
proc borderStyle*(s: string) = setStyle("borderStyle", s) ## The style of an element's border (can have up to four values).
proc borderTop*(s: string) = setStyle("borderTop", s) ## All the borderTop properties in one declaration.
proc borderTopColor*(s: string) = setStyle("borderTopColor", s) ## The color of the top border.
proc borderTopLeftRadius*(s: string) = setStyle("borderTopLeftRadius", s) ## The shape of the border of the top-left corner.
proc borderTopRightRadius*(s: string) = setStyle("borderTopRightRadius", s) ## The shape of the border of the top-right corner.
proc borderTopStyle*(s: string) = setStyle("borderTopStyle", s) ## The style of the top border.
proc borderTopWidth*(s: string) = setStyle("borderTopWidth", s) ## The width of the top border.
proc borderWidth*(s: string) = setStyle("borderWidth", s) ## The width of an element's border (can have up to four values).
proc bottom*(s: string) = setStyle("bottom", s) ## The bottom position of a positioned element.
proc boxDecorationBreak*(s: string) = setStyle("boxDecorationBreak", s) ## The behaviour of the background and border of an element at page-break, or, for in-line elements, at line-break..
proc boxShadow*(s: string) = setStyle("boxShadow", s) ## Attaches one or more drop-shadows to the box.
proc boxSizing*(s: string) = setStyle("boxSizing", s) ## Allows you to define certain elements to fit an area in a certain way.
proc captionSide*(s: string) = setStyle("captionSide", s) ## The position of the table caption.
proc clear*(s: string) = setStyle("clear", s) ## The position of the element relative to floating objects.
proc clip*(s: string) = setStyle("clip", s) ## Which part of a positioned element is visible.
proc color*(s: string) = setStyle("color", s) ## The color of the text.
proc columnCount*(s: string) = setStyle("columnCount", s) ## The number of columns an element should be divided into.
proc columnFill*(s: string) = setStyle("columnFill", s) ## How to fill columns.
proc columnGap*(s: string) = setStyle("columnGap", s) ## The gap between the columns.
proc columnRule*(s: string) = setStyle("columnRule", s) ## A shorthand property for setting or returning all the columnRule properties.
proc columnRuleColor*(s: string) = setStyle("columnRuleColor", s) ## The color of the rule between columns.
proc columnRuleStyle*(s: string) = setStyle("columnRuleStyle", s) ## The style of the rule between columns.
proc columnRuleWidth*(s: string) = setStyle("columnRuleWidth", s) ## The width of the rule between columns.
proc columns*(s: string) = setStyle("columns", s) ## A shorthand property for setting or returning columnWidth and columnCount.
proc columnSpan*(s: string) = setStyle("columnSpan", s) ## How many columns an element should span across.
proc columnWidth*(s: string) = setStyle("columnWidth", s) ## The width of the columns.
proc content*(s: string) = setStyle("content", s) ## Used with the :before and :after pseudo-elements, to insert generated content.
proc counterIncrement*(s: string) = setStyle("counterIncrement", s) ## Increments one or more counters.
proc counterReset*(s: string) = setStyle("counterReset", s) ## Creates or resets one or more counters.
proc cursor*(s: string) = setStyle("cursor", s) ## The type of cursor to display for the mouse pointer.
proc direction*(s: string) = setStyle("direction", s) ## The text direction.
proc display*(s: string) = setStyle("display", s) ## An element's display type.
proc emptyCells*(s: string) = setStyle("emptyCells", s) ## Whether to show the border and background of empty cells, or not.
proc filter*(s: string) = setStyle("filter", s) ## Image filters (visual effects, like blur and saturation).
proc flex*(s: string) = setStyle("flex", s) ## The length of the item, relative to the rest.
proc flexBasis*(s: string) = setStyle("flexBasis", s) ## The initial length of a flexible item.
proc flexDirection*(s: string) = setStyle("flexDirection", s) ## The direction of the flexible items.
proc flexFlow*(s: string) = setStyle("flexFlow", s) ## A shorthand property for the flexDirection and the flexWrap properties.
proc flexGrow*(s: string) = setStyle("flexGrow", s) ## How much the item will grow relative to the rest.
proc flexShrink*(s: string) = setStyle("flexShrink", s) ## How the item will shrink relative to the rest.
proc flexWrap*(s: string) = setStyle("flexWrap", s) ## Whether the flexible items should wrap or not.
proc cssFloat*(s: string) = setStyle("cssFloat", s) ## The horizontal alignment of an element.
proc font*(s: string) = setStyle("font", s) ## FontStyle, fontVariant, fontWeight, fontSize, lineHeight, and fontFamily in one declaration.
proc fontFamily*(s: string) = setStyle("fontFamily", s) ## The font family for text.
proc fontSize*(s: string) = setStyle("fontSize", s) ## The font size of the text.
proc fontStyle*(s: string) = setStyle("fontStyle", s) ## Whether the style of the font is normal, italic or oblique.
proc fontVariant*(s: string) = setStyle("fontVariant", s) ## Whether the font should be displayed in small capital letters.
proc fontWeight*(s: string) = setStyle("fontWeight", s) ## The boldness of the font.
proc fontSizeAdjust*(s: string) = setStyle("fontSizeAdjust", s) ## Preserves the readability of text when font fallback occurs.
proc fontStretch*(s: string) = setStyle("fontStretch", s) ## Selects a normal, condensed, or expanded face from a font family.
proc hangingPunctuation*(s: string) = setStyle("hangingPunctuation", s) ## Specifies whether a punctuation character may be placed outside the line box.
proc height*(s: string) = setStyle("height", s) ## The height of an element.
proc hyphens*(s: string) = setStyle("hyphens", s) ## Sets how to split words to improve the layout of paragraphs.
proc icon*(s: string) = setStyle("icon", s) ## Provides the author the ability to style an element with an iconic equivalent.
proc imageOrientation*(s: string) = setStyle("imageOrientation", s) ## Specifies a rotation in the right or clockwise direction that a user agent applies to an image.
proc isolation*(s: string) = setStyle("isolation", s) ## Defines whether an element must create a new stacking content.
proc justifyContent*(s: string) = setStyle("justifyContent", s) ## The alignment between the items inside a flexible container when the items do not use all available space..
proc left*(s: string) = setStyle("left", s) ## The left position of a positioned element.
proc letterSpacing*(s: string) = setStyle("letterSpacing", s) ## The space between characters in a text.
proc lineHeight*(s: string) = setStyle("lineHeight", s) ## The distance between lines in a text.
proc listStyle*(s: string) = setStyle("listStyle", s) ## ListStyleImage, listStylePosition, and listStyleType in one declaration.
proc listStyleImage*(s: string) = setStyle("listStyleImage", s) ## An image as the list-item marker.
proc listStylePosition*(s: string) = setStyle("listStylePosition", s) ## The position of the list-item marker.
proc listStyleType*(s: string) = setStyle("listStyleType", s) ## The list-item marker type.
proc margin*(s: string) = setStyle("margin", s) ## The margins of an element (can have up to four values).
proc marginBottom*(s: string) = setStyle("marginBottom", s) ## The bottom margin of an element.
proc marginLeft*(s: string) = setStyle("marginLeft", s) ## The left margin of an element.
proc marginRight*(s: string) = setStyle("marginRight", s) ## The right margin of an element.
proc marginTop*(s: string) = setStyle("marginTop", s) ## The top margin of an element.
proc maxHeight*(s: string) = setStyle("maxHeight", s) ## The maximum height of an element.
proc maxWidth*(s: string) = setStyle("maxWidth", s) ## The maximum width of an element.
proc minHeight*(s: string) = setStyle("minHeight", s) ## The minimum height of an element.
proc minWidth*(s: string) = setStyle("minWidth", s) ## The minimum width of an element.
proc navDown*(s: string) = setStyle("navDown", s) ## Where to navigate when using the arrow-down navigation key.
proc navIndex*(s: string) = setStyle("navIndex", s) ## The tabbing order for an element.
proc navLeft*(s: string) = setStyle("navLeft", s) ## Where to navigate when using the arrow-left navigation key.
proc navRight*(s: string) = setStyle("navRight", s) ## Where to navigate when using the arrow-right navigation key.
proc navUp*(s: string) = setStyle("navUp", s) ## Where to navigate when using the arrow-up navigation key.
proc objectFit*(s: string) = setStyle("objectFit", s) ## Specifies how the contents of a replaced element should be fitted to the box established by its used height and width.
proc objectPosition*(s: string) = setStyle("objectPosition", s) ## Specifies the alignment of the replaced element inside its box.
proc opacity*(s: string) = setStyle("opacity", s) ## The opacity level for an element.
proc order*(s: string) = setStyle("order", s) ## The order of the flexible item, relative to the rest.
proc orphans*(s: string) = setStyle("orphans", s) ## The minimum number of lines for an element that must be left at the bottom of a page when a page break occurs inside an element.
proc outline*(s: string) = setStyle("outline", s) ## All the outline properties in one declaration.
proc outlineColor*(s: string) = setStyle("outlineColor", s) ## The color of the outline around a element.
proc outlineOffset*(s: string) = setStyle("outlineOffset", s) ## Offsets an outline, and draws it beyond the border edge.
proc outlineStyle*(s: string) = setStyle("outlineStyle", s) ## The style of the outline around an element.
proc outlineWidth*(s: string) = setStyle("outlineWidth", s) ## The width of the outline around an element.
proc overflow*(s: string) = setStyle("overflow", s) ## What to do with content that renders outside the element box.
proc overflowX*(s: string) = setStyle("overflowX", s) ## Specifies what to do with the left/right edges of the content, if it overflows the element's content area.
proc overflowY*(s: string) = setStyle("overflowY", s) ## Specifies what to do with the top/bottom edges of the content, if it overflows the element's content area.
proc padding*(s: string) = setStyle("padding", s) ## The padding of an element (can have up to four values).
proc paddingBottom*(s: string) = setStyle("paddingBottom", s) ## The bottom padding of an element.
proc paddingLeft*(s: string) = setStyle("paddingLeft", s) ## The left padding of an element.
proc paddingRight*(s: string) = setStyle("paddingRight", s) ## The right padding of an element.
proc paddingTop*(s: string) = setStyle("paddingTop", s) ## The top padding of an element.
proc pageBreakAfter*(s: string) = setStyle("pageBreakAfter", s) ## The page-break behavior after an element.
proc pageBreakBefore*(s: string) = setStyle("pageBreakBefore", s) ## The page-break behavior before an element.
proc pageBreakInside*(s: string) = setStyle("pageBreakInside", s) ## The page-break behavior inside an element.
proc perspective*(s: string) = setStyle("perspective", s) ## The perspective on how 3D elements are viewed.
proc perspectiveOrigin*(s: string) = setStyle("perspectiveOrigin", s) ## The bottom position of 3D elements.
proc position*(s: string) = setStyle("position", s) ## The type of positioning method used for an element (static, relative, absolute or fixed).
proc quotes*(s: string) = setStyle("quotes", s) ## The type of quotation marks for embedded quotations.
proc resize*(s: string) = setStyle("resize", s) ## Whether or not an element is resizable by the user.
proc right*(s: string) = setStyle("right", s) ## The right position of a positioned element.
proc tableLayout*(s: string) = setStyle("tableLayout", s) ## The way to lay out table cells, rows, and columns.
proc tabSize*(s: string) = setStyle("tabSize", s) ## The length of the tab-character.
proc textAlign*(s: string) = setStyle("textAlign", s) ## The horizontal alignment of text.
proc textAlignLast*(s: string) = setStyle("textAlignLast", s) ## How the last line of a block or a line right before a forced line break is aligned when text-align is "justify".
proc textDecoration*(s: string) = setStyle("textDecoration", s) ## The decoration of a text.
proc textDecorationColor*(s: string) = setStyle("textDecorationColor", s) ## The color of the text-decoration.
proc textDecorationLine*(s: string) = setStyle("textDecorationLine", s) ## The type of line in a text-decoration.
proc textDecorationStyle*(s: string) = setStyle("textDecorationStyle", s) ## The style of the line in a text decoration.
proc textIndent*(s: string) = setStyle("textIndent", s) ## The indentation of the first line of text.
proc textJustify*(s: string) = setStyle("textJustify", s) ## The justification method used when text-align is "justify".
proc textOverflow*(s: string) = setStyle("textOverflow", s) ## What should happen when text overflows the containing element.
proc textShadow*(s: string) = setStyle("textShadow", s) ## The shadow effect of a text.
proc textTransform*(s: string) = setStyle("textTransform", s) ## The capitalization of a text.
proc top*(s: string) = setStyle("top", s) ## The top position of a positioned element.
proc transform*(s: string) = setStyle("transform", s) ## Applies a 2D or 3D transformation to an element.
proc transformOrigin*(s: string) = setStyle("transformOrigin", s) ## The position of transformed elements.
proc transformStyle*(s: string) = setStyle("transformStyle", s) ## How nested elements are rendered in 3D space.
proc transition*(s: string) = setStyle("transition", s) ## A shorthand property for setting or returning the four transition properties.
proc transitionProperty*(s: string) = setStyle("transitionProperty", s) ## The CSS property that the transition effect is for.
proc transitionDuration*(s: string) = setStyle("transitionDuration", s) ## How many seconds or milliseconds a transition effect takes to complete.
proc transitionTimingFunction*(s: string) = setStyle("transitionTimingFunction", s) ## The speed curve of the transition effect.
proc transitionDelay*(s: string) = setStyle("transitionDelay", s) ## When the transition effect will start.
proc unicodeBidi*(s: string) = setStyle("unicodeBidi", s) ## Whether the text should be overridden to support multiple languages in the same document.
proc userSelect*(s: string) = setStyle("userSelect", s) ## Whether the text of an element can be selected or not.
proc verticalAlign*(s: string) = setStyle("verticalAlign", s) ## The vertical alignment of the content in an element.
proc visibility*(s: string) = setStyle("visibility", s) ## Whether an element should be visible.
proc whiteSpace*(s: string) = setStyle("whiteSpace", s) ## How to handle tabs, line breaks and whitespace in a text.
proc width*(s: string) = setStyle("width", s) ## The width of an element.
proc wordBreak*(s: string) = setStyle("wordBreak", s) ## Line breaking rules for non-CJK scripts.
proc wordSpacing*(s: string) = setStyle("wordSpacing", s) ## The spacing between words in a text.
proc wordWrap*(s: string) = setStyle("wordWrap", s) ## Allows long, unbreakable words to be broken and wrap to the next line.
proc widows*(s: string) = setStyle("widows", s) ## The minimum number of lines for an element that must be visible at the top of a page.
proc zIndex*(s: string) = setStyle("zIndex", s) ## The stack order of a positioned element.

# Typed Styles:

proc height*(s: SomeNumber) = setStyle("height", $s & "px") ## The height of an element.
proc width*(s: SomeNumber) = setStyle("width", $s & "px") ## The width of an element.
proc top*(s: SomeNumber) = setStyle("top", $s & "px") ## The top position of a positioned element.
proc right*(s: SomeNumber) = setStyle("right", $s & "px") ## The right position of a positioned element.
proc left*(s: SomeNumber) = setStyle("left", $s & "px") ## The left position of a positioned element.
proc bottom*(s: SomeNumber) = setStyle("bottom", $s & "px") ## The bottom position of a positioned element.
proc fontSize*(s: SomeNumber) = setStyle("fontSize", $s & "px") ## The font size of the text.
proc lineHeight*(s: SomeNumber) = setStyle("lineHeight", $s & "px") ## The distance between lines in a text.
proc zIndex*(s: SomeNumber) = setStyle("zIndex", $s) ## The stack order of a positioned element.
proc borderRadius*(s: SomeNumber) = setStyle("borderRadius", $s & "px") ## A shorthand property for setting or returning all the four borderRadius properties.
proc margin*(s: SomeNumber) = setStyle("margin", $s & "px") ## The margins of an element (can have up to four value$s & "px").
proc marginBottom*(s: SomeNumber) = setStyle("marginBottom", $s & "px") ## The bottom margin of an element.
proc marginLeft*(s: SomeNumber) = setStyle("marginLeft", $s & "px") ## The left margin of an element.
proc marginRight*(s: SomeNumber) = setStyle("marginRight", $s & "px") ## The right margin of an element.
proc marginTop*(s: SomeNumber) = setStyle("marginTop", $s & "px") ## The top margin of an element.
proc padding*(s: SomeNumber) = setStyle("padding", $s & "px") ## The padding of an element (can have up to four value$s & "px").
proc paddingBottom*(s: SomeNumber) = setStyle("paddingBottom", $s & "px") ## The bottom padding of an element.
proc paddingLeft*(s: SomeNumber) = setStyle("paddingLeft", $s & "px") ## The left padding of an element.
proc paddingRight*(s: SomeNumber) = setStyle("paddingRight", $s & "px") ## The right padding of an element.
proc paddingTop*(s: SomeNumber) = setStyle("paddingTop", $s & "px") ## The top padding of an element.
proc maxHeight*(s: SomeNumber) = setStyle("maxHeight", $s & "px") ## The maximum height of an element.
proc maxWidth*(s: SomeNumber) = setStyle("maxWidth", $s & "px") ## The maximum width of an element.
proc minHeight*(s: SomeNumber) = setStyle("minHeight", $s & "px") ## The minimum height of an element.
proc minWidth*(s: SomeNumber) = setStyle("minWidth", $s & "px") ## The minimum width of an element.
