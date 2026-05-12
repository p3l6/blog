---
title: Write swift macros
year: 2023
---
* Like a function definition, `macro name(arg) -> result`
* Proper type checking, unlike C
* Macros can be freestanding or attached
* Implementation is defined in a compiler plugin
* Macro definition is provided a swift syntax tree, and returns a separate one
  * Tree includes the macro itself
  * Compiler replaces the provided tree with the result tree
* In xcode, right click, expand macro: to see the result of a macro in source code
  * Or, jump to definition
* The macro function is declared as an `externalMacro` with the module and type that holds the implementation.
* The implementation must conform to `ExpressionMacro` (for freestanding macros)
* Macro invokes swift parser to convert return string to a swift tree
* Macro template comes with unit tests, `assertMacroExpansion`
* Roles
  * Freestanding expression, with a hash symbol
  * Freestanding declaration
  * Attached, with an at symbol
    * peer, accessor, member, memberAttribute, conformance
* Print syntax node structure using debugger in test cases
* Can define generic parameters on the macros

# Expand on swift macros
* Macros can have multiple roles, and will be expanded based on context
  * All roles that apply will be expanded, which could be more than one for a single macro usage
  * Each one will expand based on the original code, they wont compose and the order won't matter
