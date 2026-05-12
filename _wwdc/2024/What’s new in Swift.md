---
title: What’s new in Swift
year: 2024
---

* Ten years of swift!
* Already added a platform steering group,
* Adding an ecosystem workgroup, and embedded workgroup
* Already available on apple, Linux, windows
  * Expanding to fedora and Debian
  * Also making progress on wasm
* SourceKit LSP, for using vscode and others
* Cross compilation from Mac to Linux
  * Fully static Linux sdk
  * `--swift-sdk ...musl` compile flag
* Foundation
  * Foundation is now completely in swift, now for all platforms
  * Open source
* Swift Testing
  * Open source, cross platform, modern swift, multiple IDEs
* Explicitly built modules
  * More parallelism
  * Debugger can re-use artifacts. Should remove long waits for initial breakpoint.
  * Opt-in in build settings
* New GitHub org, “swiftlang” instead of just under apple’s org
* Swift 6 language mode
  * Noncopyable types
    * Ideal for structs with file descriptors as properties
    * Now can be used in generics and optionals
  * Embedded swift
    * New language subset and compilation subset
    * Disables language features that need runtime support
    * Still very close to full swift
    * Tiny (static) binary sizes
    * Used by the Secure Enclave
    * Incremental adoption via interoperability
  * C++ interop
    * More std types can be directly imported
    * Incrementally adopt swift in c++ apps
  * Typed throws
    * Good when propagating error types in generics, or constrained environments ie embedded, or perhaps when consumed in the same module
  * Data race safety
    * New synchronization primitives, Atomics, Mutex
