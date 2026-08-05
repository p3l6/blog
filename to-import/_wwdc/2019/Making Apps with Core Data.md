---
title: Making Apps with Core Data
year: 2019
---
### Modeling data
* Model explorer? an box diagram type viewer
* Attributes and relationships
* Cascade and other deletion rules
* Classes
  * Model: ManagedObjectModel
  * Store coordinator: PersistentStoreCoordinator
    * Usually manages a db on the filesystem,
  * Context: ManagedObjectContext
    * Need this to get anything done
  * All three contained in a PersistentContainer
    * easily created via model name
    * container.loadPersistenStores()
  * Contexts:
    * Query generations provide stability, set to .current
    * automaticcally merges changes from parent = true
    * Should do all data work on a context queue
      * performAndWait, perform, performBackgroundTask
  * Data
    * Can init objects, and save to create them.
    * But if you need a lot more, batch insertions.

### Controllers
* Fetching
  * Fetch requests get objs from a store. with predicates.
  * Can use KVO on these ManagedObjects with views
  * Can set sort descriptors
  * Can set batch size, limits
  * Fetch results controller, for basically streaming results as the load and update. For table views basically
* Denormalization
  * when we keep copys of data to make access more efficient. like db indexes
  * DerivedAttributes. Normalized metadata maintained for you by core data.
  * Supports duplication, transformation (lowercase etc), aggregates like count, zero param functions (now())

### Scaling
* Fetching persistent history changes
* How to know when other coordinators change the store
  * Remote Change Notifications
  * turn on with a persistent change option
  * and turn on persistent history
* Use the sanitizers
