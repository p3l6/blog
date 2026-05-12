---
title: New in cocoa
year: 2018
---
New formal protocols
more enum names updated

deprecating instance variable access for API classes

warning for deprecations on new usages only

new unarchiver methods with types and error returns.


### Dark Mode
* link with 10.14
* look for colors in the app
  * system colors will work fine
  * custom colors in asset catalogs
* look for images
  * template images
  * asset catalogs to have two pictures
* picks up colors from desktop image
* NSVisualEffectView.material
* accent colors, not just blue. NSColor.controlAccentColor
* NSColor effects, applies tints to any color
* button.contentTintColor sets a tint on a color on a button without borders

10.14 layer backed only
no longer have to set .wantsLayers, Appkit will do it for you
NSView.updateLayer()

Font antialiasing will no longer use the subpixel color thing

Deprecation to NSUserNotification! in favor of UserNotifications framework

NSGridView support in IB, (for autolayout)

custom quick actions
automator: contextual workflow
