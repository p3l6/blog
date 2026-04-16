---
title: Swift
---

## unwrapOrThrow <!-- Operator -->

This operator, `?!`, is similar to `??`, except it throws an error when nil.
[Source](https://www.avanderlee.com/swift/unwrap-or-throw/)

Usage: `let something = try getOptional() ?! ErrorClass.thingWasNil`

```swift
infix operator ?!: NilCoalescingPrecedence

/// Throws the right hand side error if the left hand side optional is `nil`.
func ?!<T>(value: T?, error: @autoclosure () -> Error) throws -> T {
    guard let value = value else {
        throw error()
    }
    return value
}
```

## Singleton <!-- Class -->

```swift
final class Highlander {
    static let shared = Highlander()
    private init() {}
}
```

## LocalizedError <!-- Error -->

```swift
enum FoobarError: LocalizedError {
   case badThing

   public var errorDescription: String? {
       switch self {
       case .badThing: return "Loggable description of the error"
       }
   }
}
```

## Mock <!-- Class -->

This is an example mock for an object with a dependency on SomeProtocol.
In the default case, no protocol is provided, and the initializer creates a concrete instance.
When mocking the dependency, a different "thing" may be provided instead.

This avoids the need to always pass in the dependencies in every case.

```swift
class FooBar<C: SomeProtocol> {
  let thing: C
  init(thing: C) { self.thing = thing }
  init() where C == ConcreteC {
    self.thing = ConcreteC(...)
  }
}
```


## Finder event debug <!-- Macro -->

Insert snippet into a finderEventCallback function, which recieves parameters `eventPaths, pathsBase, eventFlags, numEvents`.

> NOTE: Hide other logs by turning up the logging level, to see these easier.

```swift
let pathsBase = eventPaths.assumingMemoryBound(to: UnsafePointer<CChar>.self)
let pathsBuffer = UnsafeBufferPointer(start: pathsBase, count: numEvents)
let flagsBuffer = UnsafeBufferPointer(start: eventFlags, count: numEvents)
print("===Finder Event===")
for i in 0 ..< numEvents {
  let path = URL(fileURLWithFileSystemRepresentation: pathsBuffer[i], isDirectory: true, relativeTo: nil).path
  let flags = Int(flagsBuffer[i])

  if flags & kFSEventStreamEventFlagNone > 0 { print("Event Flag | \(path) | None") }
  if flags & kFSEventStreamEventFlagMustScanSubDirs > 0 { print("Event Flag | \(path) | MustScanSubDirs") }
  if flags & kFSEventStreamEventFlagUserDropped > 0 { print("Event Flag | \(path) | UserDropped") }
  if flags & kFSEventStreamEventFlagKernelDropped > 0 { print("Event Flag | \(path) | KernelDropped") }
  if flags & kFSEventStreamEventFlagEventIdsWrapped > 0 { print("Event Flag | \(path) | EventIdsWrapped") }
  if flags & kFSEventStreamEventFlagHistoryDone > 0 { print("Event Flag | \(path) | HistoryDone") }
  if flags & kFSEventStreamEventFlagRootChanged > 0 { print("Event Flag | \(path) | RootChanged") }
  if flags & kFSEventStreamEventFlagMount > 0 { print("Event Flag | \(path) | Mount") }
  if flags & kFSEventStreamEventFlagUnmount > 0 { print("Event Flag | \(path) | Unmount") }
  if flags & kFSEventStreamEventFlagItemChangeOwner > 0 { print("Event Flag | \(path) | ItemChangeOwner") }
  if flags & kFSEventStreamEventFlagItemCreated > 0 { print("Event Flag | \(path) | ItemCreated") }
  if flags & kFSEventStreamEventFlagItemFinderInfoMod > 0 { print("Event Flag | \(path) | ItemFinderInfoMod") }
  if flags & kFSEventStreamEventFlagItemInodeMetaMod > 0 { print("Event Flag | \(path) | ItemInodeMetaMod") }
  if flags & kFSEventStreamEventFlagItemIsDir > 0 { print("Event Flag | \(path) | ItemIsDir") }
  if flags & kFSEventStreamEventFlagItemIsFile > 0 { print("Event Flag | \(path) | ItemIsFile") }
  if flags & kFSEventStreamEventFlagItemIsHardlink > 0 { print("Event Flag | \(path) | ItemIsHardlink") }
  if flags & kFSEventStreamEventFlagItemIsLastHardlink > 0 { print("Event Flag | \(path) | ItemIsLastHardlink") }
  if flags & kFSEventStreamEventFlagItemIsSymlink > 0 { print("Event Flag | \(path) | ItemIsSymlink") }
  if flags & kFSEventStreamEventFlagItemModified > 0 { print("Event Flag | \(path) | ItemModified") }
  if flags & kFSEventStreamEventFlagItemRemoved > 0 { print("Event Flag | \(path) | ItemRemoved") }
  if flags & kFSEventStreamEventFlagItemRenamed > 0 { print("Event Flag | \(path) | ItemRenamed") }
  if flags & kFSEventStreamEventFlagItemXattrMod > 0 { print("Event Flag | \(path) | ItemXattrMod") }
  if flags & kFSEventStreamEventFlagOwnEvent > 0 { print("Event Flag | \(path) | OwnEvent") }
}
```

## Codable dates

To set the date format for a json api date field, create a new jsondecoder and use it when deserializing objects.
The same can be done for JSONEncoder.

```swift
private func dateDecoder() -> JSONDecoder {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    return decoder
}
```
