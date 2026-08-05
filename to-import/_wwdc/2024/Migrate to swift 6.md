---
title: Migrate to swift 6
year: 2024
---

* Opt-in for existing and new projects
* Steps per module
  * Enable strict complete checking, resolve warnings
  * Enable swift 6
  * Audit unsafe opt-outs
* These are enabled on a per-target basis
* Mutable global variables can be marked with main actor (or other global actors)
  * They can also be marked `nonisolated(unsafe)`, if safety is guaranteed by some other dispatch context system.
* **Global variables in swift are initialized lazily**, but creation is guaranteed atomic
* When dealing with library delegates that don’t specify explicit actors, but are known to always be dispatched on the main actor (for example)
  * `MainActor.assumeIsolated { ...code ... }` or `@preconcurrency ...protocol conformance`
  * Both of these trap if the actor assumption is false
