---
title: Visualize swift concurrency
year: 2022
---
Use the new instruments tool to see timelines for tasks, threads, actors, etc. Task creation call stacks.

* Common problems
  * Main actor blocking
    * Don't do extra stuff on the main thread
  * Actor contention
    * Be aware of doing large amounts of work on a single actor. Tasks can then not run in parallel.
    * Only run on the actor only when they need exclusive access to actors data, with nonisolated chunks of the code.
  * Thread pool exhaustion
    * Don't call blocking calls that wait without suspending.
    * File/networks need to use concurrent versions.
    * This can lead to running out of queues, slowing down, and even deadlocking.
    * If you need to use this stuff, do it outside of concurrency land, with dispatches and continuations.
  * Continuation misuse
    * Always call the callback, exactly once.
    * If called twice, program will crash.
    * If not called, task will leak and never resume.
    * Always use checked continuation, which detects misuse
