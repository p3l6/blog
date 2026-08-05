---
title: Work with windows in SwiftUI
year: 2024
---

* New environment actions, acting on window group ids
  * open window, dismiss window, push window
  * It’s unclear if push window is available on macOS or iPad
* Can set the new window position programmatically
  * `.defaultWindowPlacement`
  * Such as leading or trailing to another window
  * Or relative to screen corners
* `.windowResizability(.contentSize)` sets the min/max to that of the contained view
