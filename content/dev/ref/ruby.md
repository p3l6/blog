---
title: Ruby Overview
---

## Notable differences <!-- Section -->
* Function parens are optional, like bash commands 
* Repl is `irb`
* Command line doc lookup `ri`
* Dictionariess are called hashes. 
* Backticks call a shell command, but don’t return the output, it is printed. Use system to capture it. 
+ Triple equals is less strict, like checking for range inclusion.  But it’s not recommended to use over the methods.  
* Use `rbenv` to install newer versions than the system. 
## Unique concepts
* Every method has an implicit block argument, which is called with `yield`
* Symbols, ie `:something`
  * Global unique objects instead of memory allocated strings. 
  * Used for hash keys, function names, etc.
* Append opperator 
  * `string << "more characters"`
  + Also for files, arrays, etc
* Delimited types
  * `%w{some words} => array of the words`. 
  * There are others too, instead of `w`. Multiline string is one.
  * They can use almost any delimeter, if curly brace wont work.
  * `<<~EOF ... EOF` as a heredoc also works, simiar to `%{ ... }`
* String formatting
  * `"string %s %d" % ["one", 1]` Formatting with the percent sign, not terribly reccomended. 
    * `%p` will inspect the object. 
  * Interpolation with `#{}` is usually best.
  * Methods such as `printf` also exist
* `irb` uses the `inspect` method to print objects. However, interpolation uses `to_s`. `to_str` is only for things that are actually string represented.

## Flow control <!-- Section -->
* `do ... end` blocks are the same as curly braces (but different precedence for binding)
* `if ... elsif ... else ... end`
* `loop do ... end` is forever loop, like while true 
* Both if and unless can be used as blocks. Both can be used at the end of a single line. 
* If statements (and every other statement) returns a value, so can be assigned to a variable
* Last line in a block or method is implicitly returned. 

## Variables / attributes <!-- Section -->

* Variable names are important
  * Constants start with a capital letter. Likely to be all caps, but not required.
  * Globals start with `$`,
  * Object attributes start with `@`
  * Class attributes start with `@@`
* There is no public object attribute access, as if everything was private.
  * Objects can only have methods.
  * Accessors are easily defined by sybmol with `attr_accessor`, or `attr` for readonly.
* Special globals
  * `$:` search path
  * `$"` loaded modules
  * `$0` running program
  * `$*` arguments
  * `$!` current exception
  * `$@` backtrace of current exception

## Classes / objects <!-- Section -->

* Class inheritance with angle bracket. `class Dog < Animal`
* Type checking with `is_a?` method. Works for inherited types. But often checking for method existance (ie duck typing) is better, with `respond_to?`
* Mixins 
  * Define a module, then include it in a class
  * `class X; include SomeModule; end`
  * Often, use this to extend a class that already exists.
* `super` is a refernce to the parent class' _method_, not a reference to self as the parent type.
* A method can be defined on a single object, without affecting other objects of the same class. `def someObj.method ; :foobar ; end`. This also works for adding class methods, but you could just define it in the class instead, by extending the class.
* You can create your own metaprogramming class methods, like `attr`, which output class code. Usually will eventually rely on `eval, instance_eval, class_eval`
