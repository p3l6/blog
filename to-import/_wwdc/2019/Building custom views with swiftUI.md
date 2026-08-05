---
title: Building custom views with swiftUI
year: 2019
---
Parent view cannot force a size on a child view.
Child must choose it’s own size.

Swift ui rounds coordinates to nearest pixel, no antialiasing.

Frame is not a constraint, it is a view! Might not always be the same size as it’s content, since the content can choose it’s own size, up to the frames proposal.

Interface spacing guidelines are built into swiftUI, and takes into account the adaptive context.

Layout priority will affect how stacks offer space to its children. The heighest priority is offered all of the space before the others.

Many options with alignments, including custom alignments. For aligning subviews of stacks or even any views.

Shapes and drawing are really just views. All the layout modifiers will still work, etc. Unification of controls and graphics.
You can fill shapes with Color or Image or Gradient
You can do operations on them like stroke etc.

For a custom shape, you define `func path(in rect:CGRect) -> Path`
Also, define animatableData, a list of floats that swift can modify to animate your custom view.

ZStack layers views on top of each other.

Custom ViewModifiers allow you to define your own transitions.

You can use drawingGroup() to flatten all the swiftUI views into a single one for effiecient rendering with metal. But only for shapes and drawing.
