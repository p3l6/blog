---
title: Evolve your core data schema
year: 2022
---
* Lightweight migration
  * automatically at runtime
  * changes have to fit an obvious pattern
  * to rename an attribute, use the renamingIdentifier to set the previous name
  * Need to set two options to use lightweight migration, but PersistentContainer and PersistentStoreDescription both set these for you

> The changes to your data model can be made directly in the same model that is shipping with the application. There is no need to create a new version of the model to make changes. If you want to determine in advance whether Core Data can ifer the mapping model between the source and destination models without actually doing the work of migration, you can use `NSMappingModel.inferredMappingModel` method.

* Given that, what are model versions for?
  * For example, you want to make a data type change that isn't supported.
  * But you can decompose this into a series of smaller migrations that *are supported* and create explicit model versions for each of those.
  * You can even run some manual steps between those model changes, for example loading data previously on disk into a new column
* CloudKit migration rules are much more restrictive
* Useful environment variables:
  * `com.apple.CoreData.SQLDebug 3`
  * `com.apple.CoreData.MigrationDebug 3`
