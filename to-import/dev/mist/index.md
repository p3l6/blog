---
title: Mist Color Theme
---

The colors used on this site are part of a color theme I call **Mist**.
I also use it for terminals and syntax highlighting in text editors.
To learn more about the process for selecting these colors, see the [blog post](/2026/05/27/color-theme/) I wrote at that time.

There is a base color (`mist`), used for foreground/background, and eight accents colors (`red`, `cyan`, etc).
Each color has nine levels, where 100 is the lightest, and 900 is the darkest.

Preview swatches of all theme colors are on a [separate preview page](/dev/mist/preview).
Syntax highlighting examples can be seen on any blog post with significant code chunks,
such as [this one](/2023/09/06/open-any-folder-in-xcode/) or [this one](/2022/07/26/deno-vscode-ext/).
{: .note}

## Color usage

The basic palette uses seven of the `mist` shades for content, and the 400 & 600 levels of each color for accents.
Depending on a light or dark mode, either 400 or 600 is used as the standard accent, and the other is the bright/alternate.

<!-- USAGE TABLE START -->

|            | Light mode | Dark mode  |
| ---------- | ---------- | ---------- |
| Accent     | color-600  | color-400  |
| Bright     | color-400  | color-600  |
| ---------- | ---------- | ---------- |
| Selection  | blue-300   | blue-700   |
| Cursor     | blue-500   | blue-500   |
| ---------- | ---------- | ---------- |
| bg         | mist-100   | mist-900   |
| bg-sel     | mist-200   | mist-800   |
| border     | mist-300   | mist-700   |
| border-sel | mist-400   | mist-600   |
| comment    | mist-500   | mist-500   |
| text-dim   | mist-700   | mist-400   |
| text       | mist-900   | mist-200   |

<!-- USAGE TABLE END -->

Each color is assigned a group of language syntax for highlighting purposes:

* **Red:** Strings, Regex literals
* **Orange:** Preproccessor
* **Yellow:** Attributes, Numbers, Characters, Constants
* **Green:** Functions, Methods
* **Cyan:** Variables, Arguments, Class Properties
* **Blue:** Classes, Types, Urls
* **Purple:** Language (or built-in) Classes and Types and Functions
* **Magenta:** Keywords, Storage Types, HTML Tags
  * Ideally, these are **bold**

## Color Codes

This table lists hex codes[^1] for the full palette: every color at every level.

<!-- EXPANDED TABLE START -->

|     | Mist    | Red     | Orange  | Yellow  | Green   | Cyan    | Blue    | Purple  | Magenta |
| --- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| 100 | #F1F6FC | #FFF1EF | #FFF3EA | #FBF4E9 | #EEF8EE | #E9F9F6 | #ECF7FF | #F4F4FF | #FCF1FA |
| 200 | #E0E5EB | #FFDBD5 | #FBDECB | #F2E3C6 | #D4ECD5 | #C7EEE7 | #CEE9FE | #E2E1FF | #F5DBF1 |
| 300 | #CDD1D8 | #F9C1B8 | #F4C7A8 | #E6CEA0 | #B6DDB8 | #A0E0D6 | #ABD7F9 | #CDCBFB | #EBC2E5 |
| 400 | #B3B8BE | #F59C8F | #EDA571 | #D8B161 | #89CA8D | #57CEBF | #75C0F7 | #B1ADFA | #E09ED8 |
| 500 | #9DA2A8 | #E28376 | #DA8D53 | #C59A3E | #6DB573 | #21B9AA | #56AAE6 | #9B96E9 | #CC85C4 |
| 600 | #7F8489 | #B96A5F | #B27242 | #A07D31 | #58945D | #19978A | #448ABC | #7E79BE | #A76BA0 |
| 700 | #5D6166 | #894D45 | #84532F | #775C21 | #3F6D43 | #0F6F66 | #30668B | #5C598D | #7B4E76 |
| 800 | #44484D | #683832 | #643D20 | #594415 | #2D5230 | #05544C | #214C6A | #45426B | #5D3959 |
| 900 | #2A2E33 | #422420 | #402715 | #392C0F | #1E341F | #0A3530 | #163143 | #2C2A44 | #3B2539 |

<!-- EXPANDED TABLE END -->

[^1]: These hex codes are in sRGB. In some editors, (for example xcode prior to v27) the color picker may default to linear rgb; colors will look washed out.
