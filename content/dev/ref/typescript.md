---
title: Typescript
---

## Sleep <!-- Function -->

```ts
function delay(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms))
}
```

## Pretier config <!-- Setting-->

```json
{
  "endOfLine": "lf",
  "trailingComma": "es5",
  "tabWidth": 2,
  "arrowParens": "avoid",
  "semi": false,
  "singleQuote": true
}
```

## Run multiple node servers <!-- Service -->

```bash
#! /bin/bash

export WORK_DIR=/path/to/repos

# undo 'set -e' to continue after handling SIGINT, if it was set by an exterior scope
set +e

function cleanup() {
  echo
  echo "Stopping all server jobs..."
  kill $(jobs -p)
}

trap cleanup SIGINT

echo "Starting all dev processes..."

yarn --cwd $WORK_DIR/repo1 start | sed -e 's/^/[repo1] /' &
yarn --cwd $WORK_DIR/repo2 start | sed -e 's/^/[repo2] /' &
yarn --cwd $WORK_DIR/repo3 start | sed -e 's/^/[repo3] /' &

# Waits for all jobs (lines ending with &) to exit
# They will exit when killed by the trap on ctrl-C
wait

# remove trap
trap - SIGINT

echo "Done running dev!"
```
