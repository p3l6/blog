---
title: SwiftUI essentials
year: 2019
---
Container views:
```swift
VStack {
  Image()
  Text()
  Text()
}
```

Dollar signs indicate we are passing a binding instead of a normal value. They refer to state properties. This allows the subview, ie a toggle, to edit the original state.

Views can have modifiers. They create a new view from an existing view, and can be nested
```swift
Text("Some text").font(.title).foregroundColor(.green)
```
Each of these creates a view in the hierarchy or wrapper views. Behind the scenes, this is collapsed into an efficient data structure to be rendered.
Also, these two will product different results, based on order
```swift
Text("my text").background(Color.green).padding(.all)
Text("my text").padding(.all).background(Color.green)
```
If these were properties on the text instead of modifiers, we would have no way to know which order they go in.

Prefer smaller, single purpose views. Build larger views using composition.

Primitive views: views that don’t depend on other views
* Text
* Color
* Spacer
* Image
* Shape
* Divider

The declaritive code can use standard control flow, such as an if statement, to decide whether to include a view or not.

ForEach is like List, but without any other extra management or logic. It just adds the contents directly to the parent.

Form is like VStack, but intended for taking groups of fields and giving it a standard look and feel per platform.  It can also contain sections.

Button (or anything) could contain text, image or even a vstack of both as its content. And it will adjust its look and feel based on context.

Controls describe how they are used, not expressly what they look like. They will adapt to the context and situation.

Radios, Popup buttons, etc are all called Picker, with different display styles

All of the state relating to local, calendar, accent color, dark mode, etc are called Environment. Can be customized for subtrees of views, for wholistically in the previewer.
