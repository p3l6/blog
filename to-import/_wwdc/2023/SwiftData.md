---
title: SwiftData
year: 2023
---
# Meet SwiftData
* `@Model` Normal swift code defines schema
  * Just decorate the class, to create persisted properties
  * Can use simple types, or complex ones
  * Relationships between other models
  * Modifies all stored properties
  * `@Attirbute`, `@Relationship` controls how properties are inferred
    * unique, cascade, etc
  * `@Transient` to exclude a property
* Model container
  * Persistence backend
  * Customize with configurations
  * Simply specify the models to store
  * Can auto attach to swiftUI views
* Model Context
  * Tracking, fetching, updating, etc
  * Predicate and FetchDescriptor, uses macros
    * Still looks a bit verbose? context.fetch(FetchDescriptor(Predicate<type>(...)))
  * context.insert(newitem)
  * context.save()
* With SwiftUI
  * @query right in the view, no need for @published

# Build an app with SwiftData
* `@ObservableObject` -> `@Bindable` & `@Observable`
* `@State` -> `@Query`
  * Triggers view update when models change
  * Views can have lots of querys
  * Queries can sort, filter, animate
  * Uses a model context under the hood, set from a container in a property wrapper. Can setup a container for the whole app, or specific containers for specific views.
  * For previews, create an in-memory sample container
* `@Environment(\.modelContext)` to get the context for saving/inserting.
  * Don't need to save after insertion.
  * Autosaves are triggered by user input and ui events
  * Need to save explicitly before sharing data
* Document-based apps with swiftData backing
  * Must declare custom content type
  * Swiftdata documents are packages
  * Extend UTType and add to info plist. Conform to com.apple.package

# Model your schema with SwiftData
* `@Attribute(.unique)` also causes an upsert. Only applies to primitive value types, or relationships.
* `@Attribute(originalName: )` for renaming properites without migration
* Attribute has lots more
* Implicit inverses just work. Using default delete rule. Override with `@Relationship(.cascade)`
* Relationship also specifies toMany, etc
* `@Transient` marks a property as not persisted. Make sure to provide a default value.
* Migrations
  * `VersionedSchema` to declare model versions
  * Order with `SchemaMigrationPlan`
  * Define each migration stage, lightweight, custom
  * Pass migrationPlan into the model container
  * Seems a bit verbose, but I guess it makes sense.

# Migrate to SwiftData
* Generate model classes
  * Start from the old model viewer UI
  * Editor > Create SwiftData code
* Complete adoption
  * Consider how the schemas will be supported in SwiftData
  * Need a corresponding model type for each coredata entity
  * Can delete the managed model file and persistence code
  * Create a new modelContainer
  * Remove uneeded explicit saves
  * Use query instead of fetchrequest
* Coexists with core data
  * Can do both systems in a single app
  * Explicitly set url to store
  * Turn on persistent history tracking
  * Namespace existing nsmanagedobject subclasses
  * Keep schemas in sync
  * Schema versioning

# Dive deeper into SwiftData
* Configure persistence
  * `let container = try ModelContainer(for: Trip.self)`
    * Infers the types that Trip depends on, they don't need to be specified
  * Can store in memory or disk. A file a location. Or read-only. Or specify a cloudkit container
  * Can store separate graphs of data in separate containers, and then create a combined container to use in the app. They can have different storage or syncing mechanisms.
  * Can easily associate any of these with a view `.modelContainer()`
* Track and persist changes
  * Model context for subviews. Can query, edit and delete items.
  * Tracks changes until `context.save()` is called. then changes are persisted to the container.
  * Context tracks changes in the parent container to update views
  * Can manage the undo/redo stack.
  * Supports autosave, based on system events. Enabled by default for main containers and contexts, unless they were manually created.
* Modeling at scale
  * `context.enumerate()` can efficiently loop over objects based on a predicate.
  * Predicates are written with a new macro, to be powerful and simple
