---
title: What's new in SwiftUI
year: 2025
---

* Navigation containers are updated
* ToolbarSpacer
* Toolbar buttons support tinting
* Searchable modifier should go outside the main split view
  * For tab bar apps, set the search role on the pane
* Apply a `.glassEffect()` to custom views
* Ipad menu (swiping down from the top)
  * Built from the commands api on the WindowGroup, like macos
* Ipad apps are resizable, and should mostly happen automatically
* Window resize anchors used when programmatically changing shape, ie settings views
* Performance improvements with big lists and scrolling
* Nested lazy stacks work now
* New swiftUI performance instrument in xcode
* New macro `@Animatable` with `@AnimatableIgnored` to exclude struct properties and avoid custom animation handlers
* Added depth based alignment modifiers, improvements for visionOS
* Scene bridging, AppKit can create/open swiftUI scenes
  * Can show NSWindow sheets with views in them
  * NSHostingView in interface builder
* New AssistiveAccess scene, for a special content view when phone is in this mode
* Control center for mac/watch. Widgets for carplay/vision.
* Webkit swiftui apis: `WebView(url:)` or takes a `WebPage()`. Flexible and powerful.
* 3D graphs in SwiftCharts
* Improved drag/drop for multiple items. New modifiers to control behavior.
* AttributedString support for TextEditor
