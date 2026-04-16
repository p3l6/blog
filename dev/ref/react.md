---
title: React
---

## Blank Component <!-- Component -->

```ts
import * as React from 'react'

type $1Props = {}

export function $1(props: $1Props): JSX.Element {
  const [thing, setThing] = React.useState('initial')
  return (
    <>
      ...
    </>
  )
}
```

## Fix terminal hijacking <!-- Procedure -->

Comment out function `node_modules/react-dev-utils/clearConsole.js` to disable clearing.

Comment out `openBrowser` in `node_modules/react-scripts/start.js`, or export shell variable `BROWSER=NONE`.
Exporting this variable may have side effects in other programs.

## Yarn hook <!-- File -->

Alert to run yarn install, useful as a git hook for pull, merge, checkout, etc.

```sh
#!/bin/sh
if [[ $3 && $(git diff $1..$2 -- **/package.json | wc -l) -gt 0 ]]; then
  echo "$(tput setaf 1)!!!!!!!!$(tput sgr0) Package.json has changed! Run Yarn!"
  # yarn install
fi
```
