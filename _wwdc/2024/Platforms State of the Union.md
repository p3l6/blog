---
title: Platforms State of the Union
year: 2024
---

## Apple Intelligence
* On device work begins with the Foundation Model
* Lots of fine tuning for phone style tasks
* Private cloud compute, on a new OS, based on iOS
* Genmoji are written with AttributedString.
* Siri can automatically invoke actions from an apps Menu
* You can improve training with CreateML
* You can run any model within your app as well

## Xcode 16
* New generative coding models
* Predictive code completion
  * Specifically trained for swift and apple SDKs
  * Runs locally and offline
  * Uses comments as context as well
  * Parameters filled out on selection
* Swift Assist
  * Cloud assistant tool
  * Uses details from existing project
  * Privacy: your code is not used to train models
* Single view stack trace, with multi files displayed together

## Swift
* Investing in LSP for vscode
* Expanding Linux and window support
* New GitHub org, ‘swiftlang’
* Swift 6
  * Data race safety
  * This mode is opt-in
* New testing framework: Swift Testing
  * Expressive, easy, cross platform.
  * Open source package
  * `@Test(title)` `#expect(whatever)`
  * Tags
  * Parameterized tests
  * Full support in Xcode 16

## SwiftUI
* Previews
  * Uses the same build for running and previewing
  * `@Previewable` macro to set state inside a preview
* Customizations
  * New text rendering api
* Interoperability
  * Shared gesture code
  * Shared animation code

## SwiftData
* Index
* Unique
* Custom data stores
* Data store history

## RealityKit 4
* Builds stuff for all platforms the same, not just the new stuff for visionOS
* Low level access to textures and shaders

## iOS and iPadOS
+ Controls
  + Can toggle a setting, do an action, or deeplink
  + Uses app intents
+ App icons
  + Light, dark, or tint
  + Tinted icons created automatically
  + Developers should adapt to the new modes in asset catalog
+ Passkeys
  + New registration api
  + Automatically saves passkeys when logging in (dev opt in)
+ Redesigned tab bar
  + Miniature sidebar
  + Customization
+ Navigation control transition animations

## WatchOS
* Live activities ported from iOS
* Widgets, interactive
  * Relevant contexts

## macOS
* User-space file system support? (This was only mentioned, no context)
* Gaming, GPT2, new instructions and tools, new shader conversion modes, etc
