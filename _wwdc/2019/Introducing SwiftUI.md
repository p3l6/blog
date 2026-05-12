---
title: Introducing SwiftUI
year: 2019
---
Edit in either the code or the preview
Library has lists of all modifiers for views

Debug data can be added to control what the preview displays

VStack and HStack are the most common layout containers
Lists are simple just by embedding in a List() item

Animations can happen with by just wrapping with withAnimation{}
There is also a ZStack, places views on top of each over

Data flow has a few primitives, related to change notification and object binding between data and views

### Under the hood details

Views are structs, so they are stack allocated, and passed by value. They adopt the view protocol, so there is nothing inherited.
These are transformed into a small efficient data for rendering.
Because of this, you should use many, small, single purpose Views.
Very very lightweight. Extracting a subview has virtually no runtime overhead.
There is only one method: `var body: some View {}` in the view protocol
A view defines it’s dependencies, by specifiying `@state` on the property. Runtime keeps track of which state variables are read/written to know when to re-call the body. It will call body whenever it needs to draw.
Since the views are structs, whenever a call to body is made, they are all recreated, which keeps everything in sync. This is in contrast to most UI frameworks, wherein the views persist and you must keep them all up to date.
Everything must be updated in the Source of Truth, and let the views redraw based on that.
