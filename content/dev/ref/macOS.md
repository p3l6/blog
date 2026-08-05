---
title: macOS
---

## macOS releases <!-- Section -->

| Release | Name        | iOS |
|---------|-------------|-----|
| 10.15   | Catalina    |     |
| 11      | Big Sur     |     |
| 12      | Monterey    |     |
| 13      | Ventura     | 16  |
| 14      | Sonoma      | 17  |
| 15      | Sequoia     | 18  |

See also: [Bigger list](https://goshdarnappleversionnumbers.com)

## AppKit debug menu <!-- Section -->

There's an AppKit debug menu, with actions like "bundle info" "toggle system appearance" "Linking info" and "Defaults".
It appears when an app relaunches as a ladybug icon next to the Help menu.

```sh
# Enable for every app
$ defaults write -g _NS_4445425547 -bool YES

# Enable for a single app
$ defaults write com.your.app _NS_4445425547 -bool YES

# Enable while debugging in an xcode scheme
# Arguments passed on launch:
-_NS_4445425547 true
```

The number `44_45_42_55_47` is just the ascii values of the word DEBUG.


## Icons <!-- Section -->

Folder icons used by the system.

* system finder icons: `/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources`
* mojave icons: `/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/Assets.car`
and needs `https://github.com/insidegui/AssetCatalogTinkerer` to open it

## ACLs <!-- Section -->

Access control lists are extended permissions in addition to the standard unix file flags.

* `ls -e` to display acl permissions
* `chmod +a "permission string" file` to add an acl, example:
  * `chmod -R +a "backupexec allow read,readattr,readextattr,readsecurity,file_inherit,directory_inherit" /dumps`
  * `man ls` has explanations of the permission strings

## Installers <!-- Section -->

Using a command line utility, you can download the installer application for various versions of the OS. Downloads to the applications folder. You can then install on external drives, etc. (although, T2 chip boot security protection might prevent external drives... may have to disable it from recovery mode)
`softwareupdate --fetch-full-installer --full-installer-version 10.15.7`
