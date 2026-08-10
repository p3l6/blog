---
title: New in swift
---
swift 5 will have ABI stability
xcode 10 has swift 4.2

don't use "whole module" for debug builds, in compilation mode

there is a new optimization option "optimize for size"

improvements, shortcuts, synthesizations to equatable and hashable

added
* Int.random(in:range)
* Float.random(in:range)
* Array.randomElement()
* Array.shuffled()

```
#if canImport(UIKit)
#if hasTargetEnvironment(simulator)
```
