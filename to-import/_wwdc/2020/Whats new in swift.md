---
title: Whats new in swift
year: 2020
---
## Ecosystem
* Code size reductions
* Reduced heap overhead
* Swift now sits below Foundation in the stack, so it can be used to create frameworks and drivers that word previously have required c.
* New compiler diagnostics and guided errors
* Improved code completion results and speed, especially for swiftUI
* Improved indentation formatting
* Improvements in debugging
* Updated support for Ubuntu, added Centos and amazon. Official windows support coming soon.
  * Swift AWS Lambda framework

## Language and library
* Multiple trailing-closures
* Pass a key path to a function argument
* `@main`  Standarize a programs entry point
* Reduced requirements to need `self.` in closures
* Improved catch clause to have power of switch
* Extended DSLs to support `if let` and `switch`
* New `Float16`, half size float with smaller range
* Apple Archive
* Swift System, calls to system level apis
* Improved OSLog
* Swift Numerics, a math library
* Swift ArgumentParser, a new package for parsing command line arguments
* Swift StandardLKibraryPreview, a package for code that has been approved, but has not landed into a release yet
  * Provides a simpler method for implementing proposed language changes
