define("ace/mode/matching_brace_outdent",["require","exports","module","ace/range"], function(require, exports, module) {
"use strict";

var Range = require("../range").Range;

var MatchingBraceOutdent = function() {};

(function() {

    this.checkOutdent = function(line, input) {
        if (! /^\s+$/.test(line))
            return false;

        return /^\s*\}/.test(input);
    };

    this.autoOutdent = function(doc, row) {
        var line = doc.getLine(row);
        var match = line.match(/^(\s*\})/);

        if (!match) return 0;

        var column = match[1].length;
        var openBracePos = doc.findMatchingBracket({row: row, column: column});

        if (!openBracePos || openBracePos.row == row) return 0;

        var indent = this.$getIndent(doc.getLine(openBracePos.row));
        doc.replace(new Range(row, 0, row, column-1), indent);
    };

    this.$getIndent = function(line) {
        return line.match(/^\s*/)[0];
    };

}).call(MatchingBraceOutdent.prototype);

exports.MatchingBraceOutdent = MatchingBraceOutdent;
});

define("ace/mode/hext_highlight_rules",["require","exports","module","ace/lib/oop","ace/lib/lang","ace/mode/text_highlight_rules"], function(require, exports, module) {
  "use strict";

  var oop = require("../lib/oop");
  var lang = require("../lib/lang");
  var TextHighlightRules = require("./text_highlight_rules").TextHighlightRules;

  var HextHighlightRules = function() {
    var tagRegex = '\\??[_\\*a-z][-_a-z0-9]*';
    var attribRegex = '[@a-z0-9_\\-]+';
    var singleQuoteRegex = "['](?:(?:\\\\.)|(?:[^'\\\\]))*?[']";
    var doubleQuoteRegex = '["](?:(?:\\\\.)|(?:[^"\\\\]))*?["]';
    var regexRegex = '[/](?:(?:\\\\.)|(?:[^/\\\\]))*?[/][ic]*';
    var matchOperatorRegex = /(?:==)|(?:\$=)|(?:\*=)|(?:=)|(?:\^=)/;

    var stringPipes = lang.arrayToMap(
        ("trim|tolower|toupper|collapsews|prepend" +
         "|append|filter|replace").split("|"));
    var stringPipeToken = function(value) {
      if( stringPipes.hasOwnProperty(value.toLowerCase()) )
        return "constant.numeric";
      else
        return "storage";
    };

    var nodeTraits = lang.arrayToMap(
        (":empty|:child-count|:attribute-count|:nth-child|" +
         ":nth-last-child|:nth-of-type|:first-child|:first-of-type|" +
         ":last-child|:last-of-type|:nth-last-of-type|:only-child|" +
         ":only-of-type|:not|:type-matches").split("|"));
    var nodeTraitToken = function(value) {
      if( nodeTraits.hasOwnProperty(value.toLowerCase()) )
        return "entity.name.tag";
      else
        return "text";
    };


    this.$rules = {
      start: [{
        token: "keyword",
        regex: "</" + tagRegex + ">",
      }, {
        token: "keyword",
        regex: "<" + tagRegex,
        next: "node_traits",
      }, {
        token: "comment",
        regex: /#.*$/
      }, {
        defaultToken: "text"
      }],


      "tag_whitespace": [{
        token: "whitespace",
        regex: "\\s+",
      }],


      "node_traits": [{
        token: nodeTraitToken,
        regex: ":[a-z\-]+",
        next: "node_traits",
      }, {
        token: "whitespace",
        regex: " ",
        next: "attributes",
      }, {
        token: "keyword",
        regex: "/?>",
        next: "start",
      }],


      "attributes": [{
        token: "text",
        regex: attribRegex,
      }, {
        token: "entity.name.tag",
        regex: ":",
        next: "extraction",
      }, {
        token: "entity.name.tag",
        regex: "=~",
        next: "regex_match",
      }, {
        token: "entity.name.tag",
        regex: matchOperatorRegex,
        next: "attribute_value",
      }, {
        token: "constant.numeric",
        regex: "\\(",
        next: "arguments",
      }, {
        include: "tag_whitespace",
      }, {
        token: "keyword",
        regex: "/?>",
        next: "start",
      }],


      "regex_match": [{
        token: "string",
        regex: regexRegex,
        next: "attributes",
      }],


      "extraction": [{
        token: stringPipeToken,
        regex: "[a-z_]+",
        next: "attributes",
      }, {
        token: "storage",
        regex: doubleQuoteRegex,
        next: "attributes",
      }, {
        token: "storage",
        regex: singleQuoteRegex,
        next: "attributes",
      }],


      "arguments": [{
        token: "string",
        regex: doubleQuoteRegex,
      }, {
        token: "string",
        regex: singleQuoteRegex,
      }, {
        token: "string",
        regex: regexRegex,
      }, {
        token: "text",
        regex: ',',
      }, {
        include: "tag_whitespace",
      }, {
        token: "constant.numeric",
        regex: "\\)",
        next: "attributes",
      }],


      "attribute_value": [{
        token: "string",
        regex: doubleQuoteRegex,
        next: "attributes",
      }, {
        token: "string",
        regex: singleQuoteRegex,
        next: "attributes",
      }],
    };
  };

  oop.inherits(HextHighlightRules, TextHighlightRules);
  exports.HextHighlightRules = HextHighlightRules;
});

define("ace/mode/hext",["require","exports","module","ace/lib/oop","ace/mode/text","ace/tokenizer","ace/mode/matching_brace_outdent","ace/mode/hext_highlight_rules"], function(require, exports, module) {
  "use strict";

  var oop = require("../lib/oop");
  var TextMode = require("./text").Mode;
  var Tokenizer = require("../tokenizer").Tokenizer;
  var MatchingBraceOutdent = require("./matching_brace_outdent").MatchingBraceOutdent;
  var HextHighlightRules = require("./hext_highlight_rules").HextHighlightRules;

  var Mode = function() {
    this.HighlightRules = HextHighlightRules;
    this.$outdent = new MatchingBraceOutdent();
  };
  oop.inherits(Mode, TextMode);

  (function() {
    this.lineCommentStart = "#";

    this.getNextLineIndent = function(state, line, tab) {
      return this.$getIndent(line);
    };

    this.checkOutdent = function(state, line, input) {
      return this.$outdent.checkOutdent(line, input);
    };

    this.autoOutdent = function(state, doc, row) {
      this.$outdent.autoOutdent(doc, row);
    };
  }).call(Mode.prototype);

  exports.Mode = Mode;
});
                (function() {
                    window.require(["ace/mode/hext"], function(m) {
                        if (typeof module == "object" && typeof exports == "object" && module) {
                            module.exports = m;
                        }
                    });
                })();
            
