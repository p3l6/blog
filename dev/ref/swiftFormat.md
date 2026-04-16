---
title: Swift Format
---

## Config <!-- File -->

Put the following in `.swiftformat` in the repo root. Also, the swift version (ie the text `5.9`) must be set in `.swift-version`.

```
# Options

--closingparen same-line
--commas inline
--decimalgrouping 3,5
--exponentcase lowercase
--header \n {file}\n Project Name Here\n
--ifdef outdent
--indentstrings true
--semicolons inline
--typeattributes prev-line
--wrapenumcases with-values

# Rules

--disable andOperator
--enable blankLineAfterImports
--enable blankLinesBetweenImports
--disable hoistAwait
--disable hoistTry
--enable isEmpty
--enable wrapEnumCases
--disable wrapMultilineStatementBraces
```

## Action <!-- File -->

A github action description to lint the format on a PR.

```yml
name: Check PR format
on:
  pull_request:
    branches:
      - develop

jobs:
  format:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/nicklockwood/swiftformat:latest
      credentials:
        username: ${{ github.actor }}
        password: ${{ secrets.github_token }}
    steps:
      - name: Check out repository code
        uses: actions/checkout@v3
      - name: Check code formatting style
        run: swiftformat --lint .
```
