---
title: Tailor macOS windows with SwiftUI
year: 2024
---

* Remove Toolbars
  * `.toolbar(removing: .title)` no toolbar
  * `.toolbarBackgroundVisibility(.hidden, ...)` no toolbar
* About window fancy style
  * Same as above
  * `.containerBackground(.thickMaterial, ...)` make it a bit transparent
  * `.windowResizability(.contentSize)` fixed size
  * `.windowMinimizeBehavior(.disabled)` no yellow dot
  * `.restorationBehavior(.disabled)` always appear in the middle
* Complex window placement
  * `.defaultWindowPlacement{ content, context in ... }`
  * `content.sizeThatFits(.unspecified)` intrinsic size
  * `context.defaultDisplay.visibleRect` excludes menu bar and dock area
  * `.windowIdealPlacement{}` maximum zoomed size
* Extra to look into, from end slide
  * Borderless
  * Standalone alert dialogs
  * Welcome windows
