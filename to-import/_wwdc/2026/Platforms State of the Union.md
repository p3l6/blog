---
title: Platforms State of the Union
year: 2026
---

## Apple Intelligence
* Foundation models framework.
  * Now includes image input
  * Can access server models.
  * No api cost for small developers to use foundation model in cloud
  * Multimodal prompts
  * On-device OCR
  * Open source utilities package, for skills and context tracking
  * `fm chat` tool to interact with the model
  * Framework is going open source later this summer. Available for serverside swift
* CoreAI
  * Bring your own models to the devices hardware
* App intents
  * Entities and Actions
  * New ways to expose your data to spotlight and take actions via natural language
  * Can message and search from other apps.

## Platform improvements
* Addressed main liquid glass complaints, fixing window corners, adjusting sidebars and toolbars, icons, etc.
* Resizability for iOS apps (on ipad or iphone mirroring)
* SwiftUI
  * Reorderable containers, like lists, but for grid or other layouts
  * Swipe actions inside any containers
  * `@State` is now lazy under the hood
  * New button roles for toolbars
  * New document API for document based apis
* Swift
  * `@diagnose` to change warning level for specific issues
  * `anyAppleOS`
* Intel is no longer supported on macOS 27
* Removing options for the non-liquid glass design

## Developer productivity in Xcode
* ACP support, to use any compatible model
* Xcode settings saved to icloud
* No setup screen for new projects
* Customizable toolbar
* Themable full app - not just editor
  * Per project themes
* Custom variants in Previews
* Device hub, replaces simulator. More options, and can use real hardware as well
* AI conversations in full editor window
* Can add /plan in prompts
* Can add comments on plans
* Side by side chat and changes
* Agents can interact in the simulator
* Apple technology skills are built in
  * Add other skills via plugins
