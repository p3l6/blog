---
title: Bring multiple windows to swiftUI apps
year: 2022
---
* Scene basics
  * Apps -> Scenes -> Views
  * Scenes commonly have a window(s) on screen
  * Representation of a scene may vary based on platforms
  * Types:
    * WindowGroup. all
    * DocumentGroup. ios, macos
    * Settings. macos
    * Window (new). all
      * Good for singleton windows
    * Menubar extra (new) macos
      * Available as long as your app is running
      * Good for utilities
      * Two styles, standard menu, chromeless window
    * Can be composed together
* Auxiliary scenes
  * Single windows are added to the Window menu
* Scene navigation
  * `@Environment(\.openWindow)` a callable environment thing. To programmatically open windows. either by id for single windows, or a value for window groups. Additionally, another environment for document windows, for new document and open document.
  * Pass the value by identifier instead of the value type.
* Scene customizations
  * `.commandsRemoved()` can hide secondary windows' menu commands
  * can set default position and size for windows.
  * can set keyboard shortcuts to open aux windows
