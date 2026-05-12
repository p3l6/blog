---
title: What's new in swift
year: 2025
---

## Development workflow
* Ongoing effort to port spm to use swift-build, xcode's toolchain
* Swiftly now supports mac in addition to linux, and is part of swift github projects
  * Toolchains installed this way are available to choose in xcode as well
* VScode extension is official by swift.org
  * Background indexing, context sensitive code completion, better debugging
  * Project panel with swiftly
  * DocC preview
* Better build times for macros, by including pre-built swift-syntax builds (when relying on tagged releases)
* Better docs for compile errors
* Can change types of specific errors or warnings
* Better debugging of async code. Xcode can step into other threads now.

## Libraries
* `import Subprocess`
  * try await run(program name, args etc
  * Look at output with result.standardOutput
* Foundation
  * Improved notification center observing
* `import Observation`
  * Observations {} create a computed value. Value will update when any used observable things inside the closure change. As an async sequence
* Testing
  * `Attachment.record(data, etc)` Set large breadcrumbs in swift tests
  * Verify that the process exits as part of the test case

## Swift in the stack
* Embedded swift
  * Full string interpolation
  * `any` types
  * InlineArray and Span
* Server
  * Lots of usable libraries including gRPC swift v2
* Java interop (experimental)
* Containerization library
* Platforms
  * Added FreeBSD, WebAsm

## Language evolution
* Performance
  * New InlineArray<count, type>, fixed size list, elements stored inside the object without heap allocation
    * Integers can now be used in type generics!
  * New Span type replaces need for unsafeBufferPointer
* Concurrency is more approachable
  * By default, run async functions on the callers actor
  * Isolated conformance: `extension IsolatedThing: @MainActor AnywhereProtocol`
  * Mode to pick main actor by default, for mostly single threaded projects
  * Mark expensive work with `@concurrent`, to prevent using the current actor
  * In summary, start on main actor, write async code all on the main actor to avoid data races, offload specific code to background
  * Some of these are opt-in settings, since they require code changes. "Approachable concurrency", "Default actor isolation", "Strict concurrency checking". Migration tooling exists
