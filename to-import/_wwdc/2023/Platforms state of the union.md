---
title: Platforms state of the union
year: 2023
---
## Swift
* Swift macros
  * Either using the @ or # signs
  * Built with swift, using language introspection
  * Examples
    * `#URL` check that the url is vaid at compile time
    * `@AddAsync` add an async version of a completion handler function
  * Xcode can peek into the macro expansion
  * Share macros with swift packages
  * Macros for xcode previews
* C++ interop, just like existing c and objc interop
  * Share classes and functions, bridge both ways
  * Already in use helping to transition the swift compiler from c++ to swift itself
* SwiftUI
  * Animations
    * Now default to a spring based motion
    * Respond to velocity of gesture that starts it
    * KeyFrames
  * Data flow
    * `@Observable` macro on a class publishes all public properties
* **SwiftData**
  * Built on top of coredata's persistence layer
  * Uses macros to define it in swift
  * Just add `@Model` macro to a class
  * More macros to set attribute information, such as unique
  * Supports codable for enums and structs
  * `@Query` wrapper
  * `.modelContainer()` view property

## Framework updates
* WidgetKit
  * Standby on iphone
  * Interact using app intents
* TipKit
  * Guided intro and help popovers
  * Easy to setup
* ShareLink
  * Tap to share

## Hardware
* Game mode
  * Metal shader converter
* Camera
  * Zero shutter lag
  * Standarized HDR photo format
  * ScreenCaptureKit
  * Continuity camera in tvOS for conferencing or games
* Watch
  * TabView
  * `.containerBackground(.blue.gradient)`

## Values
* Privacy summary report for third party sdks
* Signature checking for third party sdks
* Communication safety features
  * Senstitive content analyzier, on device
  * Sensitive content warning, blurring
* New store kit in app purchase views, using swiftui

## Xcode 15
* Context aware code completions
* New macro style previews
* Support for git index staging
* Test report redesign
* Xcode cloud
  * Performance
  * Create testflight notes
  * macOS notarization
* New linker
* Mergeable libraries
* Download is 50 percent smaller, by removing all the other platforms

## VisionOS
* Xcode has a simulator with default room scenes
* Bring your mac screen to the vision to develop apps inside the space where they debug
* Reality composer app, for preapre 3d assets
