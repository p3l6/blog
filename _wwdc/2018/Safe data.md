---
title: Safe data
year: 2018
---

Use model types whenever possible

Verify raw length or a checksum before loading

Foundation.JsonDeserialization

Don't assume the structure, check first

initWithCoder, awakeUsing

NSSecureCoding prevents attacks allowing to pass type info before reading data
instead of after creating the class specified in the archive
protects against malicious changes

decoding failures: secure violaiton, type mismatch, archive corruption
use failWithError(_:) when decoding, then return nil
swift has Codeable protocol, better than nskeyedunarchiver, similar to NSSecureCoding
