---
title: MacOS
layout: reference
---

## Icons

system finder icons: `/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources`

mojave icons: `/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/Assets.car`
and needs `https://github.com/insidegui/AssetCatalogTinkerer` to open it

## Shortcuts

`cmd ctrl space` open emoji picker, can be expanded to the character pallet
`cmd opt c` copy path of selected item in Finder

## Get any OS installer
Using a command line utility, you can download the installer application for various versions of the OS. Downloads to the applications folder. You can then install on external drives, etc. (although, T2 chip boot security protection might prevent external drives... may have to disable it from recovery mode)
`softwareupdate --fetch-full-installer --full-installer-version 10.15.7`

## PluginKit
### xcode extensions
* list extensions `pluginkit -m -p com.apple.dt.Xcode.extension.source-editor`
* verbose output, with duplicates `pluginkit -m -p com.apple.dt.Xcode.extension.source-editor -A -D -vvv`
* remove problematic extension `pluginkit -r path/to/extension`
* Maybe add a tricky one with `pluginkit -a path/to/appex`
* **When multiple xcode copies cause problems, re-register the main one:**
```
$ PATH=/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support:"$PATH"
$ lsregister -f /Applications/Xcode.app
```

## Xcode
Setting `OS_ACTIVITY_MODE = disable` environment variable for the current scheme may hide noisy system library messages from the output. Possibly all NSLogs as well?

### Shortcuts
`ctrl cmd e` edit all in scope at cursor
