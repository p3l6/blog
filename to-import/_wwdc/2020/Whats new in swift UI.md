---
title: Whats new in swift UI
year: 2020
---
* You can now write the entire app in swiftUI
  * The `body:` property of an `App` return a `Scene`, instead of a `View`
  * Return a `WindowGroup` and optional `Settings`
  * Can use a `DocumentGroup` for a document based app
  * Use the commands modifier to add menu commands and shortcuts to the app
  * New xcode templates for this style app
  * New "Launch Screen" plist to define launch screen, can replace a storyboard
* Widgets exclusivly use swiftUI, conform to the widget protocol
* Complications can be built with swiftUI
* List: now can make outlines. Just provide a key path to a propery for children of the items
  * Uses system standard styling
* Lazy loading grid layouts, stacks
* Create toolbars using the `.toolbar {}` modifier, with toolbarItem and Button
  * Setting the placement of items semantically, multiplatform
  * Label initializer taking a name and icon, adjusts display based on context
  * Buttons have a `.help` modifier, setting tooltips, or accessibilty labels on mobile
  * Can set a `.keyboardShortcut` modifier on a Button
  * ProgressView, linear and circular
  * Guages: display a ranged value. Only shown for watch, might be elsewhere?
* `.matchedGeometryEffect` can do cool animations that move views between contexts
* `.clipShape` will mirror the shape based on the container
* Custom accent colors for app and labels
* `Link()` universal way to open a URL, either to a web page or another app
* "Sign in with Apple" button api
