// This file autogenerated by NativeMarkSpecImport
    
import Foundation
import XCTest
@testable import NativeMarkKit

final class HtmlblocksTest: XCTestCase {
    func testCase118() throws {
        // HTML: <table><tr><td>\n<pre>\n**Hello**,\n<p><em>world</em>.\n</pre></p>\n</td></tr></table>\n
        // Debug: {<table> caused p to open}<table>{<tr> caused p to open}<tr>{<td> caused p to open}<td>\n<pre>{**Hello**, caused p to open}\n**Hello**,\n<p><em>world</em>.\n</pre></p>\n{</td> caused p to open}</td>{</tr> caused p to open}</tr>{</table> caused p to open}</table>\n
        XCTAssertEqual(try compile("<table><tr><td>\n<pre>\n**Hello**,\n\n_world_.\n</pre>\n</td></tr></table>\n"),
                       Document(elements: [.paragraph([.text("<table>")]), .paragraph([.text("<tr>")]), .paragraph([.text("<td>")]), .paragraph([.text("**Hello**,")]), .paragraph([.emphasis([.text("world")]), .text(".")]), .paragraph([.text("</td>")]), .paragraph([.text("</tr>")]), .paragraph([.text("</table>")])]))
    }

    func testCase119() throws {
        // HTML: <table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n<p>okay.</p>\n
        // Debug: {<table> caused p to open}<table>\n  {<tr> caused p to open}<tr>\n    {<td> caused p to open}<td>{hi caused p to open}\n           hi\n    {</td> caused p to open}</td>\n  {</tr> caused p to open}</tr>\n{</table> caused p to open}</table>\n<p>okay.</p>\n
        XCTAssertEqual(try compile("<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n\nokay.\n"),
                       Document(elements: [.paragraph([.text("<table>")]), .paragraph([.text("<tr>")]), .paragraph([.text("<td>")]), .paragraph([.text("hi")]), .paragraph([.text("</td>")]), .paragraph([.text("</tr>")]), .paragraph([.text("</table>")]), .paragraph([.text("okay.")])]))
    }

    func testCase120() throws {
        // HTML:  <div>\n  *hello*\n         <foo><a>\n
        // Debug:  {<div> caused p to open}<div>{*hello* caused p to open}\n  *hello*\n         {<foo> caused p to open}<foo><a>\n{debug: implicitly closing a}{debug: implicitly closing p}
        XCTAssertEqual(try compile(" <div>\n  *hello*\n         <foo><a>\n"),
                       Document(elements: [.paragraph([.text("<div>")]), .paragraph([.text("*hello*")]), .paragraph([.text("<foo>")]), .paragraph([.link(Link(title: "", url: ""), text: [])])]))
    }

    func testCase121() throws {
        // HTML: </div>\n*foo*\n
        // Debug: {</div> caused p to open}</div>{*foo* caused p to open}\n*foo*\n
        XCTAssertEqual(try compile("</div>\n*foo*\n"),
                       Document(elements: [.paragraph([.text("</div>")]), .paragraph([.text("*foo*")])]))
    }

    func testCase122() throws {
        // HTML: <DIV CLASS=\"foo\">\n<p><em>Markdown</em></p>\n</DIV>\n
        // Debug: {<DIV CLASS=\"foo\"> caused p to open}<DIV CLASS=\"foo\">\n<p><em>Markdown</em></p>\n{</DIV> caused p to open}</DIV>\n
        XCTAssertEqual(try compile("<DIV CLASS=\"foo\">\n\n*Markdown*\n\n</DIV>\n"),
                       Document(elements: [.paragraph([.text("<DIV CLASS=\"foo\">")]), .paragraph([.emphasis([.text("Markdown")])]), .paragraph([.text("</DIV>")])]))
    }

    func testCase123() throws {
        // HTML: <div id=\"foo\"\n  class=\"bar\">\n</div>\n
        // Debug: {<div id=\"foo\"\n  class=\"bar\"> caused p to open}<div id=\"foo\"\n  class=\"bar\">\n{</div> caused p to open}</div>\n
        XCTAssertEqual(try compile("<div id=\"foo\"\n  class=\"bar\">\n</div>\n"),
                       Document(elements: [.paragraph([.text("<div id=\"foo\""), .softbreak, .text("  class=\"bar\">")]), .paragraph([.text("</div>")])]))
    }

    func testCase124() throws {
        // HTML: <div id=\"foo\" class=\"bar\n  baz\">\n</div>\n
        // Debug: {<div id=\"foo\" class=\"bar\n  baz\"> caused p to open}<div id=\"foo\" class=\"bar\n  baz\">\n{</div> caused p to open}</div>\n
        XCTAssertEqual(try compile("<div id=\"foo\" class=\"bar\n  baz\">\n</div>\n"),
                       Document(elements: [.paragraph([.text("<div id=\"foo\" class=\"bar"), .softbreak, .text("  baz\">")]), .paragraph([.text("</div>")])]))
    }

    func testCase125() throws {
        // HTML: <div>\n*foo*\n<p><em>bar</em></p>\n
        // Debug: {<div> caused p to open}<div>{*foo* caused p to open}\n*foo*\n<p><em>bar</em></p>\n
        XCTAssertEqual(try compile("<div>\n*foo*\n\n*bar*\n"),
                       Document(elements: [.paragraph([.text("<div>")]), .paragraph([.text("*foo*")]), .paragraph([.emphasis([.text("bar")])])]))
    }

    func testCase126() throws {
        // HTML: <div id=\"foo\"\n*hi*\n
        // Debug: {< caused p to open}<{div id=\"foo\"\n*hi* caused p to open}div id=\"foo\"\n*hi*\n
        XCTAssertEqual(try compile("<div id=\"foo\"\n*hi*\n"),
                       Document(elements: [.paragraph([.text("<")]), .paragraph([.text("div id=\"foo\""), .softbreak, .text("*hi*")])]))
    }

    func testCase127() throws {
        // HTML: <div class\nfoo\n
        // Debug: {< caused p to open}<{div class\nfoo caused p to open}div class\nfoo\n
        XCTAssertEqual(try compile("<div class\nfoo\n"),
                       Document(elements: [.paragraph([.text("<")]), .paragraph([.text("div class"), .softbreak, .text("foo")])]))
    }

    func testCase128() throws {
        // HTML: <div *???-&&&-<---\n*foo*\n
        // Debug: {< caused p to open}<{div *???-&&&- caused p to open}div *???-&&&-{< caused p to open}<{---\n*foo* caused p to open}---\n*foo*\n
        XCTAssertEqual(try compile("<div *???-&&&-<---\n*foo*\n"),
                       Document(elements: [.paragraph([.text("<")]), .paragraph([.text("div *???-&&&-")]), .paragraph([.text("<")]), .paragraph([.text("---"), .softbreak, .text("*foo*")])]))
    }

    func testCase129() throws {
        // HTML: <div><a href=\"bar\">*foo*</a></div>\n
        // Debug: {<div> caused p to open}<div><a href=\"bar\">*foo*</a>{</div> caused p to open}</div>\n
        XCTAssertEqual(try compile("<div><a href=\"bar\">*foo*</a></div>\n"),
                       Document(elements: [.paragraph([.text("<div>")]), .paragraph([.link(Link(title: "", url: "bar"), text: [.text("*foo*")])]), .paragraph([.text("</div>")])]))
    }

    func testCase130() throws {
        // HTML: <table><tr><td>\nfoo\n</td></tr></table>\n
        // Debug: {<table> caused p to open}<table>{<tr> caused p to open}<tr>{<td> caused p to open}<td>{foo caused p to open}\nfoo\n{</td> caused p to open}</td>{</tr> caused p to open}</tr>{</table> caused p to open}</table>\n
        XCTAssertEqual(try compile("<table><tr><td>\nfoo\n</td></tr></table>\n"),
                       Document(elements: [.paragraph([.text("<table>")]), .paragraph([.text("<tr>")]), .paragraph([.text("<td>")]), .paragraph([.text("foo")]), .paragraph([.text("</td>")]), .paragraph([.text("</tr>")]), .paragraph([.text("</table>")])]))
    }

    func testCase131() throws {
        // HTML: <div></div>\n``` c\nint x = 33;\n```\n
        // Debug: {<div> caused p to open}<div>{</div> caused p to open}</div>{``` c\nint x = 33;\n``` caused p to open}\n``` c\nint x = 33;\n```\n
        XCTAssertEqual(try compile("<div></div>\n``` c\nint x = 33;\n```\n"),
                       Document(elements: [.paragraph([.text("<div>")]), .paragraph([.text("</div>")]), .paragraph([.text("``` c"), .softbreak, .text("int x = 33;"), .softbreak, .text("```")])]))
    }

    func testCase132() throws {
        // HTML: <a href=\"foo\">\n*bar*\n</a>\n
        // Debug: <a href=\"foo\">\n*bar*\n</a>\n
        XCTAssertEqual(try compile("<a href=\"foo\">\n*bar*\n</a>\n"),
                       Document(elements: [.paragraph([.link(Link(title: "", url: "foo"), text: [.text("*bar*")])])]))
    }

    func testCase133() throws {
        // HTML: <Warning>\n*bar*\n</Warning>\n
        // Debug: {<Warning> caused p to open}<Warning>{*bar* caused p to open}\n*bar*\n{</Warning> caused p to open}</Warning>\n
        XCTAssertEqual(try compile("<Warning>\n*bar*\n</Warning>\n"),
                       Document(elements: [.paragraph([.text("<Warning>")]), .paragraph([.text("*bar*")]), .paragraph([.text("</Warning>")])]))
    }

    func testCase134() throws {
        // HTML: <i class=\"foo\">\n*bar*\n</i>\n
        // Debug: {<i class=\"foo\"> caused p to open}<i class=\"foo\">{*bar* caused p to open}\n*bar*\n{</i> caused p to open}</i>\n
        XCTAssertEqual(try compile("<i class=\"foo\">\n*bar*\n</i>\n"),
                       Document(elements: [.paragraph([.text("<i class=\"foo\">")]), .paragraph([.text("*bar*")]), .paragraph([.text("</i>")])]))
    }

    func testCase135() throws {
        // HTML: </ins>\n*bar*\n
        // Debug: {</ins> caused p to open}</ins>{*bar* caused p to open}\n*bar*\n
        XCTAssertEqual(try compile("</ins>\n*bar*\n"),
                       Document(elements: [.paragraph([.text("</ins>")]), .paragraph([.text("*bar*")])]))
    }

    func testCase136() throws {
        // HTML: <del>\n*foo*\n</del>\n
        // Debug: {<del> caused p to open}<del>{*foo* caused p to open}\n*foo*\n{</del> caused p to open}</del>\n
        XCTAssertEqual(try compile("<del>\n*foo*\n</del>\n"),
                       Document(elements: [.paragraph([.text("<del>")]), .paragraph([.text("*foo*")]), .paragraph([.text("</del>")])]))
    }

    func testCase137() throws {
        // HTML: <del>\n<p><em>foo</em></p>\n</del>\n
        // Debug: {<del> caused p to open}<del>\n<p><em>foo</em></p>\n{</del> caused p to open}</del>\n
        XCTAssertEqual(try compile("<del>\n\n*foo*\n\n</del>\n"),
                       Document(elements: [.paragraph([.text("<del>")]), .paragraph([.emphasis([.text("foo")])]), .paragraph([.text("</del>")])]))
    }

    func testCase138() throws {
        // HTML: <p><del><em>foo</em></del></p>\n
        // Debug: <p><del><em>foo</em></del></p>\n
        XCTAssertEqual(try compile("<del>*foo*</del>\n"),
                       Document(elements: [.paragraph([.text("<del>"), .emphasis([.text("foo")]), .text("</del>")])]))
    }

    func testCase139() throws {
        // HTML: <pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\n<p>okay</p>\n
        // Debug: <pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\n<p>okay</p>\n
        XCTAssertEqual(try compile("<pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\nokay\n"),
                       Document(elements: [.codeBlock(infoString: "", content: "\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n"), .paragraph([.text("okay")])]))
    }

    func testCase140() throws {
        // HTML: <script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\n<p>okay</p>\n
        // Debug: {<script type=\"text/javascript\"> caused p to open}<script type=\"text/javascript\">{// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\"; caused p to open}\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n{</script> caused p to open}</script>\n<p>okay</p>\n
        XCTAssertEqual(try compile("<script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\nokay\n"),
                       Document(elements: [.paragraph([.text("<script type=\"text/javascript\">")]), .paragraph([.text("// JavaScript example"), .softbreak, .text("document.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";")]), .paragraph([.text("</script>")]), .paragraph([.text("okay")])]))
    }

    func testCase141() throws {
        // HTML: <style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\n<p>okay</p>\n
        // Debug: {<style\n  type=\"text/css\"> caused p to open}<style\n  type=\"text/css\">{h1 {color:red;}\n\np {color:blue;} caused p to open}\nh1 {color:red;}\n\np {color:blue;}\n{</style> caused p to open}</style>\n<p>okay</p>\n
        XCTAssertEqual(try compile("<style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\nokay\n"),
                       Document(elements: [.paragraph([.text("<style"), .softbreak, .text("  type=\"text/css\">")]), .paragraph([.text("h1 {color:red;}"), .softbreak, .text("p {color:blue;}")]), .paragraph([.text("</style>")]), .paragraph([.text("okay")])]))
    }

    func testCase142() throws {
        // HTML: <style\n  type=\"text/css\">\n\nfoo\n
        // Debug: {<style\n  type=\"text/css\"> caused p to open}<style\n  type=\"text/css\">{foo caused p to open}\n\nfoo\n
        XCTAssertEqual(try compile("<style\n  type=\"text/css\">\n\nfoo\n"),
                       Document(elements: [.paragraph([.text("<style"), .softbreak, .text("  type=\"text/css\">")]), .paragraph([.text("foo")])]))
    }

    func testCase143() throws {
        // HTML: <blockquote>\n<div>\nfoo\n</blockquote>\n<p>bar</p>\n
        // Debug: <blockquote>\n{<div> caused p to open}<div>{foo caused p to open}\nfoo\n</blockquote>\n<p>bar</p>\n
        XCTAssertEqual(try compile("> <div>\n> foo\n\nbar\n"),
                       Document(elements: [.blockQuote([.paragraph([.text("<div>")]), .paragraph([.text("foo")])]), .paragraph([.text("bar")])]))
    }

    func testCase144() throws {
        // HTML: <ul>\n<li>\n<div>\n</li>\n<li>foo</li>\n</ul>\n
        // Debug: <ul>\n<li>\n{<div> caused p to open}<div>\n</li>\n<li>{foo caused p to open}foo</li>\n</ul>\n
        XCTAssertEqual(try compile("- <div>\n- foo\n"),
                       Document(elements: [.list(ListInfo(isTight: true, kind: .bulleted), items: [ListItem(elements: [.paragraph([.text("<div>")])]), ListItem(elements: [.paragraph([.text("foo")])])])]))
    }

    func testCase145() throws {
        // HTML: <style>p{color:red;}</style>\n<p><em>foo</em></p>\n
        // Debug: {<style> caused p to open}<style>{p{color:red;} caused p to open}p{color:red;}{</style> caused p to open}</style>\n<p><em>foo</em></p>\n
        XCTAssertEqual(try compile("<style>p{color:red;}</style>\n*foo*\n"),
                       Document(elements: [.paragraph([.text("<style>")]), .paragraph([.text("p{color:red;}")]), .paragraph([.text("</style>")]), .paragraph([.emphasis([.text("foo")])])]))
    }

    func testCase146() throws {
        // HTML: <!-- foo -->*bar*\n<p><em>baz</em></p>\n
        // Debug: {<!-- foo --> caused p to open}<!-- foo -->{*bar* caused p to open}*bar*\n<p><em>baz</em></p>\n
        XCTAssertEqual(try compile("<!-- foo -->*bar*\n*baz*\n"),
                       Document(elements: [.paragraph([.text("<!-- foo -->")]), .paragraph([.text("*bar*")]), .paragraph([.emphasis([.text("baz")])])]))
    }

    func testCase147() throws {
        // HTML: <script>\nfoo\n</script>1. *bar*\n
        // Debug: {<script> caused p to open}<script>{foo caused p to open}\nfoo\n{</script> caused p to open}</script>{1. *bar* caused p to open}1. *bar*\n
        XCTAssertEqual(try compile("<script>\nfoo\n</script>1. *bar*\n"),
                       Document(elements: [.paragraph([.text("<script>")]), .paragraph([.text("foo")]), .paragraph([.text("</script>")]), .paragraph([.text("1. *bar*")])]))
    }

    func testCase148() throws {
        // HTML: <!-- Foo\n\nbar\n   baz -->\n<p>okay</p>\n
        // Debug: {<!-- Foo\n\nbar\n   baz --> caused p to open}<!-- Foo\n\nbar\n   baz -->\n<p>okay</p>\n
        XCTAssertEqual(try compile("<!-- Foo\n\nbar\n   baz -->\nokay\n"),
                       Document(elements: [.paragraph([.text("<!-- Foo"), .softbreak, .text("bar"), .softbreak, .text("   baz -->")]), .paragraph([.text("okay")])]))
    }

    func testCase149() throws {
        // HTML: <?php\n\n  echo '>';\n\n?>\n<p>okay</p>\n
        // Debug: {< caused p to open}<{?php\n\n  echo '>';\n\n?> caused p to open}?php\n\n  echo '>';\n\n?>\n<p>okay</p>\n
        XCTAssertEqual(try compile("<?php\n\n  echo '>';\n\n?>\nokay\n"),
                       Document(elements: [.paragraph([.text("<")]), .paragraph([.text("?php"), .softbreak, .text("  echo '>';"), .softbreak, .text("?>")]), .paragraph([.text("okay")])]))
    }

    func testCase150() throws {
        // HTML: <!DOCTYPE html>\n
        // Debug: {< caused p to open}<{!DOCTYPE html> caused p to open}!DOCTYPE html>\n
        XCTAssertEqual(try compile("<!DOCTYPE html>\n"),
                       Document(elements: [.paragraph([.text("<")]), .paragraph([.text("!DOCTYPE html>")])]))
    }

    func testCase151() throws {
        // HTML: <![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\n<p>okay</p>\n
        // Debug: {< caused p to open}<{![CDATA[\nfunction matchwo(a,b)\n{\n  if (a caused p to open}![CDATA[\nfunction matchwo(a,b)\n{\n  if (a {< caused p to open}<{b && a caused p to open} b && a {< caused p to open}<{0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]> caused p to open} 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\n<p>okay</p>\n
        XCTAssertEqual(try compile("<![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\nokay\n"),
                       Document(elements: [.paragraph([.text("<")]), .paragraph([.text("![CDATA["), .softbreak, .text("function matchwo(a,b)"), .softbreak, .text("{"), .softbreak, .text("  if (a")]), .paragraph([.text("<")]), .paragraph([.text("b && a")]), .paragraph([.text("<")]), .paragraph([.text("0) then {"), .softbreak, .text("    return 1;"), .softbreak, .text("  } else {"), .softbreak, .text("    return 0;"), .softbreak, .text("  }"), .softbreak, .text("}"), .softbreak, .text("]]>")]), .paragraph([.text("okay")])]))
    }

    func testCase152() throws {
        // HTML:   <!-- foo -->\n<pre><code>&lt;!-- foo --&gt;\n</code></pre>\n
        // Debug:   {<!-- foo --> caused p to open}<!-- foo -->\n<pre><code>&lt;!-- foo --&gt;\n</code></pre>\n
        XCTAssertEqual(try compile("  <!-- foo -->\n\n    <!-- foo -->\n"),
                       Document(elements: [.paragraph([.text("<!-- foo -->")]), .codeBlock(infoString: "", content: "<!-- foo -->\n")]))
    }

    func testCase153() throws {
        // HTML:   <div>\n<pre><code>&lt;div&gt;\n</code></pre>\n
        // Debug:   {<div> caused p to open}<div>\n<pre><code>&lt;div&gt;\n</code></pre>\n
        XCTAssertEqual(try compile("  <div>\n\n    <div>\n"),
                       Document(elements: [.paragraph([.text("<div>")]), .codeBlock(infoString: "", content: "<div>\n")]))
    }

    func testCase154() throws {
        // HTML: <p>Foo</p>\n<div>\nbar\n</div>\n
        // Debug: <p>Foo</p>\n{<div> caused p to open}<div>{bar caused p to open}\nbar\n{</div> caused p to open}</div>\n
        XCTAssertEqual(try compile("Foo\n<div>\nbar\n</div>\n"),
                       Document(elements: [.paragraph([.text("Foo")]), .paragraph([.text("<div>")]), .paragraph([.text("bar")]), .paragraph([.text("</div>")])]))
    }

    func testCase155() throws {
        // HTML: <div>\nbar\n</div>\n*foo*\n
        // Debug: {<div> caused p to open}<div>{bar caused p to open}\nbar\n{</div> caused p to open}</div>{*foo* caused p to open}\n*foo*\n
        XCTAssertEqual(try compile("<div>\nbar\n</div>\n*foo*\n"),
                       Document(elements: [.paragraph([.text("<div>")]), .paragraph([.text("bar")]), .paragraph([.text("</div>")]), .paragraph([.text("*foo*")])]))
    }

    func testCase156() throws {
        // HTML: <p>Foo\n<a href=\"bar\">\nbaz</p>\n
        // Debug: <p>Foo\n<a href=\"bar\">\nbaz{debug: implicitly closing a}</p>\n
        XCTAssertEqual(try compile("Foo\n<a href=\"bar\">\nbaz\n"),
                       Document(elements: [.paragraph([.text("Foo"), .link(Link(title: "", url: "bar"), text: [.text("baz")])])]))
    }

    func testCase157() throws {
        // HTML: <div>\n<p><em>Emphasized</em> text.</p>\n</div>\n
        // Debug: {<div> caused p to open}<div>\n<p><em>Emphasized</em> text.</p>\n{</div> caused p to open}</div>\n
        XCTAssertEqual(try compile("<div>\n\n*Emphasized* text.\n\n</div>\n"),
                       Document(elements: [.paragraph([.text("<div>")]), .paragraph([.emphasis([.text("Emphasized")]), .text(" text.")]), .paragraph([.text("</div>")])]))
    }

    func testCase158() throws {
        // HTML: <div>\n*Emphasized* text.\n</div>\n
        // Debug: {<div> caused p to open}<div>{*Emphasized* text. caused p to open}\n*Emphasized* text.\n{</div> caused p to open}</div>\n
        XCTAssertEqual(try compile("<div>\n*Emphasized* text.\n</div>\n"),
                       Document(elements: [.paragraph([.text("<div>")]), .paragraph([.text("*Emphasized* text.")]), .paragraph([.text("</div>")])]))
    }

    func testCase159() throws {
        // HTML: <table>\n<tr>\n<td>\nHi\n</td>\n</tr>\n</table>\n
        // Debug: {<table> caused p to open}<table>\n{<tr> caused p to open}<tr>\n{<td> caused p to open}<td>{Hi caused p to open}\nHi\n{</td> caused p to open}</td>\n{</tr> caused p to open}</tr>\n{</table> caused p to open}</table>\n
        XCTAssertEqual(try compile("<table>\n\n<tr>\n\n<td>\nHi\n</td>\n\n</tr>\n\n</table>\n"),
                       Document(elements: [.paragraph([.text("<table>")]), .paragraph([.text("<tr>")]), .paragraph([.text("<td>")]), .paragraph([.text("Hi")]), .paragraph([.text("</td>")]), .paragraph([.text("</tr>")]), .paragraph([.text("</table>")])]))
    }

    func testCase160() throws {
        // HTML: <table>\n  <tr>\n<pre><code>&lt;td&gt;\n  Hi\n&lt;/td&gt;\n</code></pre>\n  </tr>\n</table>\n
        // Debug: {<table> caused p to open}<table>\n  {<tr> caused p to open}<tr>\n<pre><code>&lt;td&gt;\n  Hi\n&lt;/td&gt;\n</code></pre>\n  {</tr> caused p to open}</tr>\n{</table> caused p to open}</table>\n
        XCTAssertEqual(try compile("<table>\n\n  <tr>\n\n    <td>\n      Hi\n    </td>\n\n  </tr>\n\n</table>\n"),
                       Document(elements: [.paragraph([.text("<table>")]), .paragraph([.text("<tr>")]), .codeBlock(infoString: "", content: "<td>\n  Hi\n</td>\n"), .paragraph([.text("</tr>")]), .paragraph([.text("</table>")])]))
    }

    
}