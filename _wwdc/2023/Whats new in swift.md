---
title: Whats new in swift
year: 2023
---

Version 5.9

* Open source workgroups update
  * Vision documents are collections of themed proposals
* if/else & switch used as expressions
  * Can replace complex ternary expressions with easier to read if/elseif/else statements, used as the assignment
* Better errors in SwiftUI
* Variable length arguments in generics
  * `<each Result>` type parameter packs.
  * Used for functions that want to accept variable length args of a generic type, when each corresponds to a specific return type.
* Macros
  * Distributed as packages
  * Defined like `public macro assert(_ condition: Bool) = #externalMacro(...)`
  * Written as a compiler extension that takes in the source code and returns a resulting expanded code.
  * Freestanding macros can be used everywhere
  * Attached macros work like property wrappers, with `@`
  * Can inspect macro generated code, and debug into it
    * Right click, "expand macro"
    * Errors will auto expand
  * Different types of attached macros to declare what level the new code goes in, such as members, peers, etc.
  * `@Observable` class macro adds Published to every member, and then also takes care of declaring it as ObservedObject when used in a view.
    * This uses three separate macros under the hood.
* Swift on low level systems
  * Open sourced the re-write of Foundation in swift
  * Converting C and objC to swift
  * Will be the single shared apple and non apple version of foundation
  * Significant performance improvements
* Type ownership
  * Copyable by default, of course
  * `struct FileDescriptor: ~Copyable {}` marks a struct as Not-Copyable
    * You can then include a deinit method.
    * You can add `consuming` functions, which make the object unusable
* C++ interop
  * Swift understands common c++ idioms
    * May sometimes need annotations to help swift understand
  * Works in both directions
  * Swift will produce a generated header
  * Dont need to use an equivalent of `@objc`, most swift types will just work
  * Cmake
    * Worked with cmake team to add swift as a langauge option
    * Can include cpp and swift together
* What's new in swift concurrency
  * Custom actor executors, to implement the queue processing for tasks
  * Conform to the `SerialExecutor` protocol
