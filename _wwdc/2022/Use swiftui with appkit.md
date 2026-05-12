---
title: Use swiftui with appkit
year: 2022
---
* NSHostingController to embed swiftui in appkit
* Use ObservableObject to share state between the two
* Hosting controllers will set themselves to the ideal size of the contained view. Swiftui will push min/max sizes up to the next level for you, and set some layout contraints.
* `.focusable()` swiftui views can respond to keyboard events sent to the responder chain.
* swiftui already has modifiers for common commands, such as copy, cut, paste. use `.onCommand(selector)` to handle other appkit events
* For more on focus, "direct and reflect focus in swiftui"
* Can also use app kit views inside swiftui. with NSViewRepresentable, ...ControllerRepresentable
  * This is actually a bit more complicated than the reverse
