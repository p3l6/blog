---
layout: post
author: Paul
title: Using Deno in a Vscode Extension
---

I have recently integrated some Deno flavored typescript modules with a vscode extension. 
This was part of a conversion from python to Deno for a custom build tool I use. 
After the initial conversion, I wanted to include bits and pieces of the build tool in a vscode extension to be able to report errors and warnings in my open files. 
Overall, this worked quite well, and I’ll outline the process I used.

## Dependencies
* Vscode
* `Vsce` from `npm install -g vsce` for packaging extensions
* Deno

## Source example
This first file is the deno module we’ll be importing. In my actual use case, this is really just a file that imports and re-exports all the elements I need from modules used in other scripts. 

```ts
// deno/lib.ts

export function helloFromDeno(): string {
  return "Hello from Deno!"
}
```

The next file is used to run the transformation from deno -> node. It uses [dnt](https://deno.land/x/dnt@0.21.0) and is a boilerplate script found in the readme for that package. 

```ts
// deno/mod.ts
import { build, emptyDir } from "https://deno.land/x/dnt@0.21.0/mod.ts";

await emptyDir("./npm");

await build({
  entryPoints: ["./lib.ts"],
  outDir: "./npm",
  shims: {
    // see JS docs for overview and more options
    deno: true,
  },
  package: {
    // package.json properties
    name: "deno-lib-vscode-example",
    version: Deno.args[0],
    description: "Example for importing deno libraries in vscode",
    license: "MIT",
  },
});

```

If you don't already have a vscode extension, now is the time to generate one.
I added the following to the dev dependencies to the extension's package.json: `"deno-lib-vscode-example": "file:../deno/npm",`

Also, I found that I needed to [convert the vscode extension](https://code.visualstudio.com/api/working-with-extensions/bundling-extension) I had previously generated to use `esbuild`, to bundle the assets all together. The alternative would be publishing the converted npm module, instead of referencing it by file path as I have done. 

Then I was able to include the deno code as follows:

```ts
// extension/src/extension.ts 
import * as vscode from "vscode";
import { helloFromDeno } from "deno-lib-vscode-example";

export function activate(context: vscode.ExtensionContext) {
  console.log(helloFromDeno())
}
```

And that's it!

## Build script
To simplify the process of combining all this, I put this job in my project's makefile, under a `vscode` target. This builds the deno code, builds the vscode extension, and then installs it locally. 

```bash
cd deno && deno run -A build.ts 0.1.0
cd extension && npm install
cd extension && yes | vsce package
code --install-extension extension/sample-extension-0.0.1.vsix
```

## Final thoughts
I'm very pleased with the approach here, I get to re-use Deno code from my custom script inside a vscode extension to provide in-editor feedback about errors and warnings. 
When I make changes to the compiler or it's data, a simple `make vscode` and a Reload Window brings everything back into sync. 
