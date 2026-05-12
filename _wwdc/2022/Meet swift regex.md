---
title: Meet swift regex
year: 2022
---
* Defined as `struct Regex<Output>`
* Can create with a literal `/\d+/`
  * Syntax is compatible with perl, python, ruby, java, nsregularexpression, etc
* Literal syntaxes built into compiler
* Can also create strings at runtime, which will throw errors at runtime if invalid
* Also can use swiftUI style regex Builder
* can use regex as a separator in string.split
  * also string.replace
* Interweave real parsers with regex
* Supports full unicode

Example
```swift
// CREDIT   02/01/2022  Payroll  $200.23
import RegexBuilder
let fieldSeparator = /\s{2,}|\t/
let transactionMatcher = Regex {
  Capture { /CREDIT|DEBIT/ }
  fieldSeparator
  One(.date(.numeric, locale: ..., timeZone: .gmt))
  fieldSeparator
  OneOrMore {
    NegativeLookahead { fieldSeparator }
    CharacterClass.any
  }
  fieldSeparator
  One(.localizedCurrency(code: "USD").locale(...))
}
// returns: Regex<(Substring, ...)>
```

* Extended delimeter. `#/  .* / \d/#`
  * Slashes without escapes
  * Whitespace is ignored, so can add linebreaks and alignment
* Capture labels `(?<label>\d+)` name the parameter in result tuple
* Can use unicode properties to identify character classes. Such as currencySymbol
* Match various unicode named characters, like `/\N{SPARKLING_HEART}/`
* Ignore case `/blah/.ignoresCase()`
* Can choose to match at unicode scaler level instead of character level.
* TryCapture can generalize captures with negative lookahead or any other custom capture or matching logic.
* `Local{ /.../ }` creates a scope where if the regex matches, any untried variations are discarded. Useful for paring down large failure search spaces. Disables global backtracking. Also known as an atomic noncapturing group.
