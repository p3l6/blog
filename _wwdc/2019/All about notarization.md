---
title: All about notarization
year: 2019
---

Developers still control signing and distribution.
Notary service performs automated security checks. It is not an app review.
On the user end, gatekeeper checks the attached ticket vs apple’s version, then decided to allow the app.

## Application requirements
Previously distributed software can be sumitted as-is. (Signed before June 1, 2019)
New software must meet the following criteria:

* Must use complete and correct signing.
  * Bundles, Mach-Os, installer packages.
  * For some file types in the "code places", signatures will be attached as an extended attribute. Which can be lost with some types of file copies. This applies to things that are not Mach-O or bundles.
  * Deep signing may not always be enough to find everthing.
  * Each signature must have a secure timestamp
* Must use the hardened runtime:
  * Enable, then select entitlements your app needs, which can override the following enforcements
  * Prevents creation of executable memory without an associated code signature
  * Only loads code signed by your team, or apple.
  * Prevents loading unsigned or adhoc signed code. This will mean dev builds need to be signed.
  * Blocks environment variables matching DYLD_*
  * Blocks debugging of your app (for release builds of course)
  * You must declare intent to access protected resources. (Microphone, Camera, Location, Contacts, Calendars, Apple photos library, cross app Apple Events)

## Workflows
Submit all software you distribute. Ok to upload more regularly, but you don’t need to do every CI build.
Anyone on team can submit software.

Built into xcode’s archive organizer. Under distribute, signed by developer ID. Then you can export notarized app.

If you use a custom installer, such as one that downloads assets, you may need a two-step notarization.

`xcrun altool` can be used to do notarization outside of xcode.
`xcrun stapler staple`  to attach your ticket after the app succeeds.
`xcrun stapler validate`  or `spctl --assess --verbose <pkg>` to verify notarization.
