---
title: Whats new in swiftUI
year: 2022
---
* Swift Charts
  * Declaritive framework for building state driven charts
  * Really really neat
  * Can nest ForEach inside charts to add multiple data types
* Navigation and windows
  * NavigationStack
    * Supports push and pop style navigation flows
    * .navigationDestination(for:)
    * Can send the data instead of the view to push
  * NavigationSplitView
    * Two and Three column layouts
    * Works together with the previous new change
  * Scenes
    * Window
      * Like WindowGroup, but just a single window
      * Available from window menu, or assign a keyboard shortcut
      * Or add a toolbar button and open programmatically, with Environment action openWindow(id:)
      * Modifiers for default size, position, resize etc.
      * Great for little auxillary windows
    * Build menu bar extras entirely in swiftUI
* Advanced controls
  * Forms
    * New grouped form style
    * Can use multiple Text items to indicate titles and subtitles
  * Multiline text fields can expand vertically, can set lineLimit
  * MultiDatePicker
  * Mixed state toggles, in a disclosure group
  * Can make buttonStyle toggles
  * Tables, now on iPadOS
    * New toolbar design
    * Context menus
  * Search fields can have tokenized entries and scopes
* Sharing
  * Photos picker
  * ShareLink
  * Transferable protocol
    * Power swiftui drag and drop
    * .dropDestination
    * Create your own transferable types, with multiple representation options, such as Codable
* Graphics and layout
  * Shapes
    * Colos can have subtle .blue.gradient
    * .dropShadow
    * Text and image animations
  * Layout
    * Grid, GridRow, .gridCellColumns
    * Layout protocol, access to all detail layout information use to make traditional layout systems and abstractions.
