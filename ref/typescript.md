---
title: Typescript
layout: reference
---

[Functions · TypeScript](https://www.typescriptlang.org/docs/handbook/functions.html)

## Types
string, number, any, never, array[], boolean, tuple, enum, void, null, undefined, Object

can assert that a type is correct `thing as Type`

## Variables
* var is JS madness
* let is a sane mutable variable
* const is an un-assignable variable

* arrays and tuples and objects can be destructured into distinct named variables
* spread operator will combine arrays or objects

## Interfaces
* duck typing, interfaces name these types
* names an object (ie property list)
* type checker only looks that it meets the minimum, not that it is an exact match. like a ::protocol::
* properties can be optional `color? = string`
* properties can be readonly
* can have functions 
* classes can implement interfaces

## Classes
* `this` for member access
* `class Dog extends Animal`
* things are public by default, but can be private and protected
* If the constructor is protected, you can not create instances of it, only of subclasses. You can also declare the class abstract
* `readonly` properties must be initialized at declaration or in the constructor
* can use static members as well

## Functions
* Types come after arguments  `function add(x: number, y: number): number {`
* Return type is optional if it can be inferred 
* Function types are as `(x: number, y: number) => number` arg names are not matched
* Arguments can be optional, `color?: string`, or defaulted `color = “red”`
* Variable arguments `...restOfName: string[]`
* Using ‘this’ can be messy, especially when returning a function. Might need an arrow function 
* You can specify the type of ‘this’ in the arguments of a function `f(this: Something, .. )`
* For a function that takes different args, or returns different things, you overload the declarations, by multiple lines before the declaration containing the different options. 

### Arrow functions
> Normally, `this` is set when the function is called. Arrow functions capture the `this` where the function is created rather than where it is invoked.   

* Syntactically, `function() {` becomes `() => {`
* Both are anonymous functions that will probably be used as an argument, or returned.

## Generics
* Declared as expected `function something<T>(arg: T): T`
* You can have generic types, interfaces and classes, but not enums or namespaces.
* To constrain the generic type, create an interface with your requirements and specify that the generic type extends that. Since extending is duck typed, it just has to then match that shape.

## Enums
* Can be either numeric or string enums.
* Const enums are a thing, and are replaced at compile time.

## Type Compatibility
* Structure typing, ::not named typing::
* Since js typically uses anonymous objects, it makes sense to base type comparisons on shape.
> x is compatible with y if y has at least the same members as x  

* Function comparison is more complex.

## Advanced Types
### Intersection types
`Person & Serializable & Loggable` has all the members of all three types
### Union types
`number | string` one type or the other  
Can only access members that are common to the union
### Type guards
Restrict something to a certain subtype in a particular scope  
Custom type guards  
`typeof`  
`instanceof` like typeof but looks at the constructor function
### Nullable types
Can use flag `—strictNullChecks` to prevent any variable from being assigned null, unless you use a union type containing null.
### Type aliases
These create a new name for an existing type.
### String literal types and numeric literal types
Specify the exact value a string must have. Other strings will not be able to be assigned. Useful when combined with union types.  
Same things exists with numbers
### Conditional types
`T extends U ? X : Y`
Choose the type based on some condition  
Lots more going on here.

## Iterators and Generators
```
for (let x of list) // loops over the values of list
for (let i in list) // loops over the keys of list
```
“of” can only be used on Symbol.iterator things, while “in” can be used on any object to enumerate it’s properties

## Modules
* Variables, functions etc are not visible outside their module, unless exported. (and then imported)
* Any file containing imports or exports is considered a module (without those, it is a script with contents available at the global scope)
* You can declare one thing as the default export, so that it can be imported without specifying what
* Use `declare module` to create the types for things that already exist

## Namespaces
* Can add organization to types inside a single file
* `/// <reference path=“Validation.ts” />` is needed to have multi-file namespaces
* Can use import to create aliases for deeply nested things
* Can be helpful in describing the shape of js libraries to import

## Namespaces and Modules
Don’t mix the two too much. Node uses modules almost exclusively

## Declaration Merging
If you define something, ie an interface, multiple times, ts will combine the members from both.
You can merge a class and a namespace to get the effect of an inner class.

## JSX
An xml like language that compiles to js, used largely in react.  
Need .tsx extension

## Decorators
* Experimental feature as of now.
* `@decorator` where decorator refers to a `function decorator(target)` that will do something important
* If a class decorator returns, it will modify the class declaration
* You can basically decorate anything, Didn’t read it too carefully.

## Triple-Slash Directives
Compiler directives of form `/// <reference path="..." />`  
Only valid at top of file

## Utility Types
* `Partial<T>`: new type has all properties of T, but they are optional
* `Readonly<T>`: new type has all properties of T, but they are readonly
* `Record<K,T>`: 
* `Pick<T,K>`: new type by picking the properties K from T
* `Omit<T,K>`: opposite of pick
* `Exclude<T,U>`
* `Extract<T,U>`
* `NonNullable<T>`: removing null and undefined from T
* `ReturnType<T>`: The return type of T
* `InstanceType<T>`: The instance type of a constructor function
* `Required<T>`: new type has all properties of T, but they are required
* `ThisType<T>`

