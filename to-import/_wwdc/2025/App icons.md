---
title: New look of app icons
year: 2025
---
* Liquid glass layers
* Translucent and tint modes
* Apps will have the same icon on all devices (other than the watch is a cirlce)
* New corner radius
  * old icons will automatically adjust the corners if they are a similar shape
* No more irregular icon shapes on mac
* Layering is a key component of the new icons
  * at least one background and forground
  * foreground layers should stack, not go around each other
  * Use simple art styles
* Translucency and blur is easy now
* Simplifying the elements in your app can help
  * Baked-in effects (shadows etc) should be removed, so as to not fight the glass effect
  * Rounded corners in shapes will be better than hard corners
* Backgrounds 
  * should have a gradient, which can be default
  * colored backgrounds are preferred
# Create icons with icon composer
* History
  * Mac icons used to be created at various sizes
  * Then even more sizes were required
  * Later an option to just add one image per platform
  * Then new modes were added
  * Now we can do all this in a single file
* Start in an another design tool
  * Use vectors or svgs
  * Use the app icon template to get the right canvas size (1024)
  * Create the layers for your icon. Split by z-depth and color
  * Be as basic as possible. shapes should be flat and opaque
* Export each layer as an svg
  * Except backgrounds
  * Prefix with zlayer
  * Don't export the rounded rect mask, just squares
* Import into composer
  * Each group can have glass properties. Up to four. But more than one svg can be in each group
  * Lots of properties to change, and can be customized per variant

