---
title: New in swift
year: 2018
---
swift 5 will have ABI stability
xcode 10 has swift 4.2

don't use "whole module" for debug builds, in compiliation mode

there is a new optimization option "optimize for size"

improvements, shrtcuts, synthesizations to equatable and hashable

added
* Int.random(in:range)
* Float.random(in:range)
* Array.randomElement()
* Array.shuffled()

```
#if canImport(UIKit)
#if hasTargetEnvironment(simulator)
```
