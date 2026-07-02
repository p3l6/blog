---
title: What's New in SwiftData
year: 2026
---

* Section (or group by) inside `@Query`
* Mark model attributes as Codable, to delegate serialization
  * Internals will not be available for filtering or sorting
  * Changing type will not trigger a migration, codability must handle forward/backward compatibility
* ResultsObserver, a way to detect changes in swift data from non-views, ie `@Query` is unavailable
* HistoryObserver, can sync model changes to an external source
