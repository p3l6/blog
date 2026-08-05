---
title: Whats new in SwiftUI
year: 2021
---
* `AsyncImage`
* async functions attached to views
  * start at view load
  * cancel when view dissapears
* Get bindings to listed elements, instead of just the elements
  * `List($someCollection) { $item in`
  * Built into swiftui, works everywhere, foreach, etc.
* Custom swipe actions
* Mac multicolumn tables
  * `Table(items) { TableColumn("foo") { Content($0) }.width(20)`
  * support selection, sorting, styling
  * integrates with coredata fetch requests
* `Text`
  * markdown support
    * bold, links etc
    * based on the new swift AttributedString
  * automatic localization
  * new date/list formatting stuff
* Buttons
  * buttonStyle, controlSize, controlProminence
  * `.confimationDialog()`  `.destructive()`
  * `.menuIndicator()` to hide arrow on menu buttons
    * primary action vs long press
  * ControlGroup for toolbar items
