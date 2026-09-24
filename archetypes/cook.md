---
title: {{ .File.ContentBaseName | title }}
date: {{ .Date | time.Format "2006-01-02 15:04:05 -07:00" }}
---

|| Ingredients |
|-:|-|
1 C        | lower case list
1 dozen    | no trailing punctuation
&nbsp;     | item without an amount
units      | Qt C Tbsp tsp lbs oz dozen pkg
frac chars | ⅛  2¼  ⅓  1½  ⅔  ¾

## Directions

1. Capitalized.
2. Trailing periods.
  1. Sub-steps. (indent three)

> [!SOURCE]
> Optional recipe source

### Appendix

* Notes about recipe evolution.
  * Or alternate suggestions.
* Capitals and periods, like directions.
