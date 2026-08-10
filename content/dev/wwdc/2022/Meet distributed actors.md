---
title: Meet distributed actors
---
* Location transparency. interact with distributed actors the same way regardless if they are local or not
* Need to declare the actor system
  * And initialize it by taking it in the init method. (To override during tests)
* Add distributed keyword to class, and functions that will be called remotely
  * Method args and return types must be Codable. (for the default actor system, others may require other serializatiion conformance)
* Create local actors normally
  * But "resolve" remote actors by calling static resolve() on the type
  * You can resolve remotes that don't actually exist yet. It will be created on the server the first time a message for it is received. Generally the actor system needs to implement this logic.
* Receptionist mechanism for local discovery
