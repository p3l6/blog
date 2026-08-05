---
title: Swift Testing
year: 2024
---

* Completely new testing framework, to effectively replace XCTest, designed for swift
* `import Testing`
* `@Test func checkSomething() {}`
  * Can be global, or nested in a type
  * Can be async or throws
  * Can be actor isolated
* `#expect(a == b)`
  * Accepts ordinary expressions and operators
  * Shows detailed results on failure
* `try #require()` similar to expect, but aborts test on a failure
  * Can also be used like a guard, to unwrap an optional
* Traits
  * Display name, bug reference, tags
  * Enable/disable based on conditions
  * Time limit
  * Serialized instead of paralell
* Suites are structs that contain tests
  * Can be explicitly annotated `@Suite`, but are inferred anyway
  * Can have stored instance props
  * `init / deinit` for setup and teardown (deinit only on class/actor)
  * A separate suite instance is created per test, state is not shared
* Parameterized testing
  * Add an argument to the test function
  * Add a list of those arguments to the test macro `@Test(arguments:[...])`
  * Can re-run an individual argument
* XCTest and swift testing can co-exist in a single target
* Run from command line `swift test`
* `#expect(thorws: (any Error).self) {...}` or `#expect {...} throws: {...}`
  * Also works for require
* `withKnownIssue{...}` surfaces failures as expected, but still runs the tests so they don’t drift. Slightly different reporting than the `.disabled` trait.
* `CustomTestStringConvertible` protocol for improving parameter logs
* Any sendable type can be a parameterized test input
* If you pass multiple parameter inputs, all pairs will be tested. Eg, they will not be zipped.
  * Only accepts two collections, to reduce exponential growth here
  * You can also explicitly call zip inside the macro, to group the collections
* To create tags, `extension Tag { @Tag static var blah: Self }`
* Parallel testing is enabled by default, can add serial trait to a suite if needed
* Don’t use expect inside completion handler, as it will run after the test completes. Instead, use await, or withCheckedContinuation if necessary.
* A confirmation can be used to make sure a callback happens the expected number of times.
