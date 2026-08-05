---
title: What’s new in Xcode
year: 2024
---

* Code completion, on device model specifically trained for swift and apple SDKs
* Swift 6, fully data race safety
  * Can enable all “upcoming” features in Xcode build settings now
  * Then change the swift version build setting when ready
* Previews
  * `@Previewable` attached to prop wrappers, so writing wrapper views is no longer necessary. Useful to preview items that take bindings, for example.
  * `@PreviewModifier` Useful for mocking environment objects that provide data via expensive tasks, like api calls. Or good for swift data model containers
  * Faster than ever, due to shared build products
* Explicit modules. An opt-in more parallelized build ordering.
* New unified stack trace view, have to enable it in the debug bar
* 3D scene debugger
* Swift Testing `@Test` on any function.
  * `#expect(a == b)`
  * More detailed value inspection on failures
  * Quick action: test again, re-runs last test
  * Can also set arguments, for parameterized tests. And have test suites. And have tags.
* New flame graph in instruments
