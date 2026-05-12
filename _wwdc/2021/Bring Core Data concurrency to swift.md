---
title: Bring Core Data concurrency to swift
year: 2021
---
* standard context methods gain async/await
* Dont return managed objects from the perform block. Use objectId result type, or dictionary result type.
  * Need to do all the managed object work within the block
* Use the address and thread sanitizer, in scheme settings
  * Core data has a specific flag, env var, `com.apple.CoreData.ConcurrencyDebug 1` to add extra checks
* lazy core data provider setup in swiftUI
