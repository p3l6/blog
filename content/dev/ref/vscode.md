---
title: Visual studio code
---

## Find and replace, changing case <!-- Section -->

This is done with the modifiers `\u\U\l\L`, where `\u` and `\l` will upper/lowercase a single character, and `\U` and `\L` will upper/lowercase the rest of the matching group.

The modifiers can be stacked and appear before the referenced group in replace.
ie: `\u\u\u$1` or `\l\U$1`

## High contrast <!-- Setting -->

These are the section and tab borders from the default high contrast theme.
`src/vs/workbench/common/theme.ts`,
`src/vs/platform/theme/common/colorRegistry.ts`

This can be placed into settings to overlay high contrast onto another theme.

```json
"workbench.colorCustomizations": {
  "contrastBorder": "#6FC3DF",
  "contrastActiveBorder": "#F38518",
  "focusBorder": "#F38518",

  "peekView.border": "#6FC3DF",
  "tab.border": "#6FC3DF",
  "tab.lastPinnedBorder": "#6FC3DF",

  "tab.activeBorder": "#00000000" ,
  "tab.unfocusedActiveBorder": "#00000000" ,
  "tab.activeBorderTop": "#00000000" ,
  "tab.unfocusedActiveBorderTop": "#00000000" ,
  "tab.activeModifiedBorder": "#00000000" ,
  "statusBar.focusBorder": "#00000000" ,

  "activityBar.inactiveForeground": "#666666", // 0xff * 0.4

  "activityBar.activeBorder": "#6FC3DF" ,
  "activityBar.foreground": "#6FC3DF" ,
  "editorGroupHeader.border": "#6FC3DF" ,
  "editorGroupHeader.tabsBorder": "#6FC3DF" ,
  "editorGroup.border": "#6FC3DF" ,
  "editorGroup.dropIntoPromptBorder": "#6FC3DF" ,
  "sideBySideEditor.verticalBorder": "#6FC3DF" ,
  "sideBySideEditor.horizontalBorder": "#6FC3DF" ,
  "panel.border": "#6FC3DF" ,
  "panelTitle.activeBorder": "#6FC3DF" ,
  "panel.dropBorder": "#6FC3DF" ,
  "panelSectionHeader.border": "#6FC3DF" ,
  "panelSection.border": "#6FC3DF" ,
  "statusBar.border": "#6FC3DF" ,
  "statusBar.noFolderBorder": "#6FC3DF" ,
  "activityBar.border": "#6FC3DF" ,
  "sideBar.border": "#6FC3DF" ,
  "sideBarSectionHeader.border": "#6FC3DF" ,
  "titleBar.border": "#6FC3DF" ,
  "notificationCenter.border": "#6FC3DF" ,
}
```
