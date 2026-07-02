---
title: What's New in Swift
year: 2026
---

## Everyday ergonomics
* No longer need parens in `(some Rocket)?`
* Can call async inside defer
* Can use weak let in sendable
* Can set `~Sendable` explicity
* Structs with mix of property scopes will have multiple initializers for different scopes
* Simplify availability since version numbers are aligned `@available(anyAppleOS 27, *)`
* `@diagnose` to hide swift warnings, or enable others, or upgrade to errors
* Can use double colon as a module selector, which can work around tricky import issues with conflicting modules
  * Should not use these generally, only when needed. Dont design apis to require them.

## Libraries
* Standard library
  * TaskCancellationShield, inside this isCancelled always returns false
  * Dict.mapKeyedValues
  * New filepath struct
* Testing
  * Set severity level
  * Cancel tests dynamically
  * Cli flags: maximum reps, repeat until fail
  * Better integration between swift testing and xctest
* Subprocess: better output stream handling
* Foundation
  * Progress manager
  * Moved more things to swift

## Fullstack swift
* C Interopability extended to call swift from c code
* Can now bridge swift span to cpp20 span
* Can call async and throwing swift functions from java
* Easier to install toolchains from vscode extension
* Better bridging between javascript and swift-wasm
* Existential types added to embedded swift, as well as untyped throws

## Performance
* `@inline(always)`
* `@specialized(where Values == [SomeType]` to hint how generics should be expanded, in a library context
* Adding Borrow for memory shaing
  * While borrowed, imutable on both sides
  * A mutate variation where the borrower can modify, and the owner cannot read
  * This will be used in for loops over Iterable (not over Sequence)
  * Can use `borrow/mutate` in place of `get/set` for computed properties
  * `UniqueBox` is a safe alternative to UnsafeMutablePointer. Also have `UniqueArray`
  * Ref and MutableRef types

## Open source
* Swift build is now the default for SPM
