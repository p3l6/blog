---
title: React
layout: reference
---

## Fix terminal
`node_modules/react-dev-utils/clearConsole.js` comment function to disable  
`node_modules/react-scripts/start.js` comment out openBrowswer (Or export `BROWSER=NONE`)

## Run yarn from a git hook
```sh
#!/bin/sh
if [[ $3 && $(git diff $1..$2 -- **/package.json | wc -l) -gt 0 ]]; then
  echo "$(tput setaf 1)!!!!!!!!$(tput sgr0) Package.json has changed! Run Yarn you fool!"
  #npm install
fi
```

## Function components
Can have nested functions but don't have to worry about binding.  
Pass in props, return render.  
For each state variable: `const [thing, setThing] = useState(initialThingVal)` 
