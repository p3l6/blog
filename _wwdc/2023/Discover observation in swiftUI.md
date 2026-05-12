---
title: Discover observation in swiftUI
year: 2023
---
* A new swift feature for tracking changes to properties on a class
* Just add the `@Observable` macro
* Don't need any property wrappers on the members, or even in the SwiftUI view that watches it
  * SwiftUI intelligently tracks properties, so it only redraws for props it depends on
* Property wrappers in swiftUI
  * Sometimes, no wrapper needed at all
  * `@State` for a specific item internal to a view.
  * `@Environment` is good for global values. Can use observable types here
  * `@Bindable` (new) Allows bindings to be create for that type, use the $ syntax to get the binding. ie, to use a text field on a property of an Observable
* Can have nested Observable, or arrays of Observable, computed props, etc
  * Never really need to worry about it
  * There's a specific manual case with computed properties that don't rely on an observed propery. You'd need to manually trigger the change notifications
* Converting from ObservableObject
  * Remove Published prop wrappers, and protocol confomances
  * Add Observable
  * Remove ObservedObject from view code
    * May need a bindable
