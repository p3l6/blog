---
title: Core data sundries
year: 2020
---
* Batch operations. Streamlined insert update and delete
  * no save notifications
    * can enable persistent history to work around
  * no managed objects created
  * Basically creates a single transaction. Faster, few notification.
  * Can set an SQL upsert merge policy on context.
* Fetch only neccessary data. Batched fetching.
  * Decide if relationshsips are pre-fetched or fetched on read.
* ObjectID result type is thread safe.
  * ManagedObjects are not.
  * Dictionary results exist too, a read only data set to pass to other threads.
* CD has a lot of notifications for many updates
  * New ObjectID notification
  * NSRemoteChangeNotification. CD change notifications between processes. By using PersistentHistory.
  * Should tailor requests to the applications need, for example based on a changed date .

See also "making apps with core data"
