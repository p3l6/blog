---
title: What’s new in SwiftUI
year: 2024
---

* Sidebar morphs to a compact tab bar
  * Tab view is now type safe
  * Apply to a tabView `.tabViewStyle(.sidebarAdaptable)`
  * Has re-ordering and removing of tabs
  * On macOS, appears as a segmented control inside the toolbar, when not in sidebar mode
  * Also works on tvOS
* Sheet presentation sizing is consistent
* New zoom transition looks cool for expanding content to a full page
* Create control center items
  * A new kind of widget that uses app intents
* Function plots in swift charts
* Dynamic number of table columns
* Mesh color gradients, makes a neat background
* Document based app launch scene
  * Set backgrounds, buttons, and accessory views
  * System automatically shows recent documents along the bottom
* SFSymbol effects: wiggle, breathe, rotate
* New window settings on macOS, style, level, placement, drag gestures
* New macos scenes: utility window
* PushWindow environment action
* Modifier alternates for menu actions
  * Any view can respond to modifier key changes
* Customize pointer style per view
* Handle pencil actions
* Text formats for live datetime offsets
* Custom container views using `ForEach(subviewOf:) {}`
  * Ideal for making custom things with apis that behave like List or Picker
* `@Entry` macro to simplify custom environment keys
  * Also works for a few other values types
* Use state directly in a preview without a wrapper view
* Programmatic text selection, via a binding to a range
  * Or check if the field is focused
  * Add text suggestions to any field
* Color.mix to blend colors
* Detect if a view is visible in a scroll view
* View struct is now marked `@MainActor`, don’t need to do this manually
