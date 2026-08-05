---
title: What’s new in SwiftData
year: 2024
---

* Schema macro: Unique
  * Performs upsert on collision
  * Best to also decorate the unique columns with the preserveValueOnDeletion attribute. This will make sure they are kept to identify items when using the history api
* History
  * Inserts, updates, deletes
  * Deletes kept in history as tombstone values
  * Works with custom data stores (that are built to support it)
* Model container options
  * In memory, autosave, undo support
  * Or, a custom model container can be used, such as to customize the location on disk
  * Can now even use a completely custom data store, such as backed by json files
* Preview traits
  * Shared context for all previews
  * Ideally, in memory options
  * A “trait” that adds this context to all views in the preview
  * Have to add an extension to PreviewTrait to add to previews
  * So in the end: `#Preview(traits: .sampleData) {...}`
  * And for a view that takes a single item: `@Previewable @Query var items: [Item]; SomeView(item: items.first)`
* Optimized queries
  * Predicates to facilitate search
  * `#Expression` builds complex predicates
  * `#Index` single or compound indexes in the underlying model container
