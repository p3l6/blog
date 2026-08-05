---
title: Swift actors
year: 2021
---
* pass by value can reduce a lot of data races, in some cases
* actors are very high level concepts for mutable state, easier to do correctly than atomics, mutexes, and locks.
* Actors isolate their state from the rest of the program. So you have to go through it, and it ensures exclusive access
* `actor` A new type, like struct or enum, but is a reference type like class
* synchronous code inside an actor always runs uninterrupted, until completion.
* however, any state can have changed after a call to await something inside an actor. Need to revalidate assumptions when the await finishes.
* So, make sure to keep the actor state in a consistent state whenever calling await.
* Isolation refers to code which either runs inside the actor, or outside. Only isolated code can read any mutable state of the actor; to prevent data races.
* Nonisolated keyword allows declaring functions that seem inside the actor, but aren’t. These cannot access mutatable state. Useful in protocol conformance sometimes.
* sendable types are safe to share concurrently. ie value types, or actors.
* eventually it will become an error to pass a non-sendable type across actor boundaries.
* Sendable is a protocol you can adopt. Swift will check that it follows the rules. Basically, like codable, all it’s stuff must also be sendable
* Add sendable to your types that are safe to share concurrently.
* Functions can also be @Sendable
* @MainActor can tag functions that need to run on main thread. Then swift can verify that all calls to this run on the main thread.
* Can mark types as main actor as well. Nonisolated would ever ride for specific methods
