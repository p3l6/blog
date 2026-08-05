---
title: Swift package manager
year: 2018
---
swift build
swift run
swift test
swift package
swift package init

packages rely on tagged versions in git

package specified in swift

dependencies: src location, version
targets: name, deps
products: name, targets. can be library or executable

semantic versioning: major breaking changes . compatible addiitons . bug fixes

Cannot shell out as part of build

tests use XCTest

? how do you include a package in an app?

Not fully mature yet, or integrated into any tools (including xcode)

swift and package manager is open souce
go to bug tracker and look for ones labeled StarterBug

Good uses so far are for CLI programs and Server side swift
