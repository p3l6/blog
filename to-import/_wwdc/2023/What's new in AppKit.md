---
title: What's new in AppKit
year: 2023
---
* Controls
  * Table column customization
  * NSProgressIndicator can take a Task.progress binding
  * New `.automatic` NSButton bezel style
  * Button bezel styles renamed from appearance to usage
  * Inspectors, new sidebars like the Xcode right bar
    * Back compatible to Big Sur
    * Add `.toggleInspector` to split view toolbar items
  * Popovers can anchor to toolbar items
* Menus
  * Menus were rewritten for cocoa instead of carbon
  * New section headers
  * Pallet menus, basically a compact menu of icons
    * Select any / select one
    * Should have the same target action pair
  * Menu badges, with strings, counts and labeled counts
* Cooperative app activation
  * Activate is now a request instead of a command
    * `ignoringOtherApps:` param is deprecated and ignored
  * Yield api can be used from the current active app to pick the next active app. This just allows the other apps activation request to succeed.
* Graphics
  * NSBezierPath and CGPath have a conversion helper
  * CADisplayLink on macOS, to sync to display refresh rate
  * New gray system background fill colors
  * Most views no longer clip to their bounds. So drawing can occur outside. Visible rect might extend outside band. dirtyRect is not contsrained by the bounds.
* Text improvements
  * Symbol effects: bounce, transitions, pulse, etc
  * Locale aware symbols and images
  * Insertion indicator adapts to accent color
  * Cursor accessory shows caps lock, etc
  * Locale aware line breaking for morphemes
* Swift and SwiftUI
  * Appropriate appkit classes marked as sendable and transferable
  * @ViewLoading property wrapper
  * Previews for AppKit views
  * HostingView improvements for bridging scenes and modifiers between the drawing stacks
