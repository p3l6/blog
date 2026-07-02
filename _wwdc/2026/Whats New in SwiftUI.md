---
title: What's New in SwiftUI
year: 2026
---

* `appearsActive` environment flag for dimming background window elements
* Option to force icons in menus, since most were removed by default
* Resize handles in live previews
* Tabview role `.prominent` for right side placement
* Toolbar visibility priority selector, determines which actions go to overflow at low widths. Also can force items into the overflow, or set one as trailing to never overflow.
* `WritableDocument` protocol for document based apps
  * Also `ReadableDocument`
  * Deal with snapshots, structs that describe document state
  * read/write can do diffs on the snapshots to save incrementally
  * Can write in multiple formats
* Reorderable and container can apply drag and drop to any list or lazyVGrid etc
* Swipe actions and container can add these actions to non-tables
* AsyncImage caching
* More efficient storage of `@Observable` in a `@State`, by making them lazy.
