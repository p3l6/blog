---
title: New in swift
year: 2019
---
ABI stability
Module stability
So different components can be built by different compiler versions
You can distribute binary frameworks for others to use

Swift packages more tightly integrated

Shared swift runtime improves performance of applications
Shared runtime will still be included if building for backwards compatibility
iOS app store will thin this out on downloads
Apps will use the system runtime if availible
Faster launch time

Strings changed from UTF16 to UTF8
Swift c interop without overhead
20% more http requests with SwiftNIO after change to utf8

Open source technologies
Swift official docker images
SourceKit
Language server protocol coming in the future. github.com/apple/sourcekit-lsp

Support for SIMD, "single instruction multiple data"
Redesigned string interpolation, with custom interpolators

Opaque result types, ie "some Shape"
Property wrapper types, reduces code repetition declaring computed properties

Define embedded DSLs in swift. Domain specific language, ie HTML
This is used to power the declarive syntax of SwiftUI as well
