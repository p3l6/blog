---
title: Whats new in Swift
year: 2022
---
## Community update
* DocC and swift website open sourced
* New c++ interop workgroup to explore integration

## Swift packages
* TOFU, trust on first use, package fingerprinting
* Command plugins, ie formatters and linters
  * DocC gets objc and c support
  * Build tool plugins too, can add additional steps during build

## Performance improvements
* Build times faster
  * Swift directly in xcode build tools instead of a separate executable
* Faster type checking, with new implementations
* Runtime improvements
  * Protocol api cacheing

## Concurrency updates
* Can back deploy async await to older OSs
* Data race avoidance
  * Moving to thread safety by default for swift 6
  * `actor` and `distributed actor`. See additional session about this
* Async algorithms
  * Open source package for things using AsyncSequence
  * zip, merge, debounce, chunked
* Actor prioritization, priority-inversion avoidance
  * New swift actor instrument, to visualize swift tasks

## Expressive swift
* `if let thing = thing` becomes `if let thing`. works for guard as well
* .compactMap, map but filtering nil
* New rules for pointer conversions when calling c functions
* String processing
  * Less trimming/splitting etc, more regex
  * Literals are declared  between forward slashes
  * Or, can create regexes with a swiftUI style syntax library.
    * Can turn these in to nestable components, or recursive
    * Take care of types and matching, ie for dates
  * Uses a new regex parser in swift
* Generic code clarity
  * Fixes for tricky errors I've never ran into
  * Adds the `any` keyword to distinguish box types of protocol conformance from generic types
  * But generics are better, so use them when possible
    * new  `some` keyword allows removing some boilerplate with generics
