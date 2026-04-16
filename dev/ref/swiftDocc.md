---
title: Swift DocC
---

## Format <!-- Section -->

```swift
/// Three slashes start the doc comments.
///
/// First line is the summary, then a blank,
/// then the description.
/// Standard markdown can be used here: headings, lists, bold, italic, code, links, images.
///
/// There are a few special fields as well, see next section for full list.
/// - Returns: A description of the returned object.
func something() -> Type {}
```

Code blocks may be either indented or fenced.

## Comment fields <!-- Field -->

The primary fields are:

* `- Parameter name: description`
  * Or:
  ```
  - Parameters:
      - name: Descr
      - second: More descr
  ```
* `- Returns: descr`
* `- Throws: descr`

There are other less used fields that still have special meaning in xcode:
- Precondition, Postcondition, Requires, Invariant, Complexity, Important, Warning
- Author, Authors, Copyright, Date, SeeAlso, Since, Version
- Attention, Bug, Experiment, Note, Remark, ToDo

## Changelog <!-- Section -->

Here is a template for changelogs that fit a docC style

```md
# Changelog

All notable changes to this project will be documented in this file.

## Overview

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), with slight modifications to fit .docC archives, and this project (mostly) adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Types of changes: New, Improved, Fixed, Removed.

## [Unreleased]

- Improved: ...
- New: ...

## [1.2.3] - 1 Jan 1900

- Fixed: ...
```
