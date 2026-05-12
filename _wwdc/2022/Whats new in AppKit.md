---
title: Whats new in AppKit
year: 2022
---
## Stage manager
* Wont swap out floating, modal, or preference toolbar windows
* Set collectionBehavior flags

## Preferences
* Renamed to system settings
* New form control, `Form {}.formStyle(.insetGrouped)`
* Custom prefpane bundle will still work
* In app preferences were renamed to settings. So stop using "preferences" in other places

## Controls
* NSComboButton. immediate button action and pull down menu.
* NSColorWell. New default look. new styles too, minimal and expanded which is minimal and default side by side.
* NSToolbar. set immovable items. item:canBeInsertedAt: for fine grained control. centeredItemIdentifiers. possibleLabels to layout based on the longest possible label.
* NSAlert. Wider alert layout for long descriptions.
* NSTableView. improved performance for variable height cells, by estimating heights and lazy calling heightOfRow.

## SFSymbols
* SFSymbols 4.
* Symbols will have a preffered rendering mode.
* Variable symbols for audio or wifi etc. add a floating point number.

## Sharing
* NSSharingServicePicker
* Creates a standard menu item that can be included in custom menus
