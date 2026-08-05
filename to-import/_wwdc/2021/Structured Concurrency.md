---
title: Structured Concurrency
year: 2021
---
In addition to async/await, Tasks can manually be created to get greater control

## Sequential binding
ie `async let result = URLSession.shared.data(...)`
Swift creates a child task to evaluate right side
Following lines continue to run until one need the result of the assignment.
Will need to use `try await` to read it

This can be used to run multiple tasks at once!

Can check for task cancellation:  as a boolean, or a try.

## Group tasks
This is like Promise.all

```
try await withThrowingTaskGroup(of: (String, UIImage).self) { group in
 for ... {
		group.async { return ... try await ... }
	}
	for try await (id, img) in group {
		// mutable assignment of result from previous block
	}
 }
```

The group task uses a @sendable closure that cannot capture mutable variables. Only things that have their own syncronization

## Unstructured tasks
Similar to @MainActor to run classes on main thread

```
Task {
   ...
}
```

Runs on the same actor as the enclosing scope

Can be created from non-async code.
Need to manually cancel, await etc, not as much compiler help.
Maybe use defer to remove clean it up.
Useful for delegate methods on UI components

## Detached tasks
like unstructured, but don't pick up any context from scope.
Takes parameters for how and when it should happen. `Task.detached{}`
