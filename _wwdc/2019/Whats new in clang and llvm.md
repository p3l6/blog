---
title: Whats new in clang and llvm
year: 2019
---
## New platform support
Series 4 watch. It’s 64 bit, but runs 32bit apps.
By sending LLVM bitcode to the app store. Then, app store compiles for both.

## Code size improvements
New optimization level for code size, `-Oz`
Function outlines: Extract repeated assembly sections to new functions. Especially funtion prologues and epilogues.
This can increase runtime of course, so you may want to compile different parts of the app with different optimization flags. Either focusing on speed or code size.

Some new warnings in cpp to reduce language code size

## Static analyzer
New cpp checks
