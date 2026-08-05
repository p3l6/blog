---
title: What's new in SwiftUI
year: 2023
---
* Use swiftui in more places
  * Vision OS obviously
  * WatchOS new design updates
    * `.containerBackground`
    * Toolbar items placements
    * Datepicker, selection in lists
    * Smart stack widgets
    * Lock Screen ipad widgets
    * Desktop widgets on macOS
    * Interactive widgets
  * SwiftUI wrappers for existing Frameworks
* `@Observable`
  * Just apply to a data model class
  * Don't need to mark props. All are published, **but only if you read the property in a view**
  * Only need to use `@State` and `@Environment` in the view, not the other variations.
* `@Model`
  * Mark data model classes to persist them.
  * Implies the previous `@Observable`, do not need both flags.
  * Use `@Query` instead of `@State`
* Inspector views in swiftUI
  * A sidebar similar to the Xcode inspector
* Dialog suppression toggle
* Dialog`HelpLink`
* Table improvements
* Animation
* `.sensoryFeedback`
* Text views interpolated inside a text view string
  * Apply metal shaders to text
* ScrollView
  * `.scrollTransition` to apply effects to items entering or exiting the scroll area. Like shrink or fade.
  * `.safeAreaInset` makes a "sticky header"
  * `.containerRelativeFrame` inside a scroll view or forEach can specify sizes like 2/5 of width, with spacing between
  * `.scrollTargetBehavior` to set the snapping of items as the scroll view goes by
* Static member syntax for asset colors
* `.compactMenu` style, for picking icons
* Border button shape style
* Buttons on Mac can react to drag actions
* `.onKeyPress` modifier
