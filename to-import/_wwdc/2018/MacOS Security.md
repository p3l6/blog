---
title: MacOS Security
year: 2018
---

### User consent for data access
user will be prompted for many directories. even when traversing directories with the FileManager
need to add the purpose strings to the info.plist, or app will exit (when accessing that directory and linked with 10.14sdk)
`$ tccutil reset _what_ `, will reset the answers to the prompts

### Xcode: hardened runtime
new SIP runtime that is available to apps
opt-in for now, restricts many things

### Notarized apps
to block bad software before distribution
upload distribution-ready content, to get a notarization ticket
still optional for now
NOT an app review
ticket is attached to app with "stapling"
use xcode export organizer or $xcrun altool and $xcrun stapler

#### Security requirements for notarized apps
 no malicious software
all properly codesigned
must opt-in to enhanced runtime
