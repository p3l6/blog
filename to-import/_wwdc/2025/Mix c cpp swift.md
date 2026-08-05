---
title: Safely Mix C, C++, and Swift
year: 2025
---
How to annotate c/cpp to convey the information for swift compiler to call it safely, instead of importing as `UnsafeMutable...`

* Can turn on "Strict Memory Safety" compiler mode
  * Any inferred use of an Unsafe type will be a warning
  * Have to mark these cases with `unsafe` to allow them
  * Usually have to do with pointers
* Swift `Span` acts as a safe pointer.
  * Ensures you cant use out of bounds or deallocated memory.
  * There is a mutable variant
* Calling a function that takes a pointer to array and size of it as separate params
  * Want swift to import as a function taking an inout mutable span
  * use annotation `__counted_by(other_param)`  on the pointer parameter
  * Also will need `__noescape` to say that the memory will not escape the lifetime of the function. ie it will not be saved or cached in the cpp.
* Can pass a swift span to a cpp span with noescape
* To return a cpp span that is a subset of a cpp span param, mark the param as `__lifetimebound`.
* Importing a View type, which is a struct with a reference to memory that it does not own
  * annotate with `SWIFT_NONESCAPABLE`, and swift will import as `~Escapable`
* Importing custom reference counted types
  * annotate with `SWIFT_SHARED_REFERENCE()` and providing the retain and release methods
  * For any functions that return this type, annotate with either `SWIFT_RETURNS_RETAINED` or `SWIFT_RETURNS_UNRETAINED`

## New tooling
* Increase cpp safety in bounding
  * Turn on cpp std lib hardening in Xcode
  * Avoid raw pointers, use std spans, etc. Can turn on errors for raw pointers
  * Turn on xcode Enforce buffer bounds safety
* Increase c safety in bounding
  * A language extension where xcode compiler will require annotations.
  * The compiler will insert bounds check where needs
  * Turn on in xcode setting for c bounds safety
