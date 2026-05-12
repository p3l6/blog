---
title: Platforms State of the Union
year: 2021
---
## Xcode Cloud
* Designed for developing for apple platforms
* New CI tools integrated into xcode
* Built on the cloud
* Flexible and extensible
* Private and secure
* Pull request functions built in
* Don't have to worry about managing signing on your machine

## Swift
* Concurrency
  * Getting away from completionHandlers
  * Adds Async and Await
  * Structured concurrency `async let foo = ...`
  * Compiler will help manage shared state, with actors
  * `@MainActor` to declare which actors need to be run on the main thread
* SwiftUI
  * Multicolumn table on mac
  * And more
* Swift playgrounds
  * Create apps on ipad, even submit them

## AR and Graphics
* RealityKit2
  * Object Capture, Proggrametry
* Metal
  * With M1, there is a unified graphics platform
  * Interleave graphics and compute primitives in shaders
  * API to add an on-screen controller easily, mimics phisical controllers
  * Selective shader debugging

## User engagement
* Focus
  * Ranks notifications based on "interruption levels"
    * passive, active, time sensitive, critical
    * Critical notifications are for safetly, will need a approved entitlement
  * Communication contact photos replace app icon
  * Notification summary
  * Basically a segmented Do not Disturb
  * API to access focus status, notification priority
* ScreenTime API
  * Hook into parental controls for custom flows
* Widgets for iPad
  * New extra large size for iPad
  * Wiget suggestions for smart stacks
* SharePlay
  * Media is not 're-streamed' over facetime. shareplay only syncronizes the playback.
  * No loss in quality
  * End to end encrypted, managed group leading services
  * GroupActivities framework
  * Demo: Shared whiteboard. Neat
