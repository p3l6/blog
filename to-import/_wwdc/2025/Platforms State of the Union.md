---
title: Platforms State of the Union
year: 2025
---

## Liquid Glass Design
* Goals: content first, platform consistency, joy and delight
* Principles: hierarchy, harmony, consistency
* Left aligned typography on modals, increased heights and softer shapes
* Most changes will be effected by a recompile, using the same system components
* Icons
  * modes: std, std dark, tint, tint dark, clear
  * Icon composer app: build and preview all the elements. Produces an xcode bundle, or renders
* Temporary Xcode option to skip liquid glass design, and use the previous components, for an adoption window

## Foundation model framework API
* Structs can be `@Generable` and used with the LLM to provide custom structured output
* Supports calling external toosls
* On device, so more private and cheaper than web models
* Can also use CoreML to run custom models

## Xcode
* `#Playground {}` macro to preview non-ui code right in xcode
* Integrate swift assist with ChatGpt, in addition to the native one
  * Model can edit code, write docs, or create previews, or fix compile errors
  * "Coding assist", like last years "Writing assistant"
  * Can use a free chatgpt account for limited reqs per day
  * Can also configure other models, or local, or private ones

## Swift 6.2
* `InlineArray` fixed sized arrays
* Spans, a bounded memory region that can be used safely. ie, wrapping a c-style array with known length
* Official WASM compile target
* Modules or files can be set to run on main actor by default
* Swift container framework - kinda like docker?

## SwiftUI
* Web api, new simple component to show a browser or web page
* TextEditor can handle rich text by binding to an attirbuted string
* 3d charts in SwiftCharts
* Idle prefetch when scrolling comes to mac (optimization to reduce frame drop)
* SwiftUI performance instrument
