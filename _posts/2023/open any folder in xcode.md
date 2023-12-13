---
title: Open any folder in Xcode
summary: A short shell utility to open folders as an Xcode workspace.
date: 2023-09-06 13:40 -0400
author: Paul
layout: post
---

In addition to being a great IDE, Xcode is a great general purpose text editor.
However, I still always find myself opening up projects in vscode, simply because Xcode cannot open _folders_. Xcode can only open projects and workspaces, that is, data files it specifically creates with project metadata.

On the other hand, vscode can open any folder, and search and explore the contents. I finally realized this was a simple problem to solve: I only needed a small shell script to generate Xcode workspaces containing single folders!
The only thing left to verify was the structure of an xcode workspace. I created a blank workspace, and then added a single folder reference path to it. Then jumped into a terminal to `cat` the contents:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Workspace
   version = "1.0">
   <FileRef
      location = "group:/Users/paul/tmp/SomeFolderToOpen">
   </FileRef>
</Workspace>
```

Excellent, these files are sufficiently trivial to create on the fly from a shell script. And so doing that, I saved this script as `x`, and added it to my `$PATH`.
Invoking it without arguments opens the current directory in a new Xcode workspace, and with arguments, any folder or files.

The generated workspaces are saved inside the opened folder, under a `.xcode` directory. I added this pattern to my global gitignore file, since I create the workspaces with absolute paths to the referenced contents. At first, I attempted setting group as a relative path: `location = "group:../"`, which almost worked, except that Xcode used `..` as the name of the root folder.

Below is the script:

```zsh
#!/bin/zsh

setopt extendedglob

# Show usage and exit
if [[ "$1" = "-h" ]] ; then
  cat <<EOF
===== ===== ========= ======
Xcode magic workspace opener
===== ===== ========= ======

Specify any number of paths as arguments:
- Files will be opened in individual windows
- Folders will be opened as projects
  | If the folder already contains an xcode project, that will be opened.
  | Otherwise, a new workspace will be created for you with the folder added.
  | There will only be one folder per workspace, if multiple folders are
  | specified, multiple windows will be opened.

Without any arguments, the current working directory will be opened
EOF
exit 0
fi

openItem() {
  A=$(realpath $1)
  basename=$(basename $A)

  if [[ -f $A ]] ; then
    echo Opening file: $1
    open -a Xcode.app $1

  elif [[ -d $A ]] ; then
    # First try to open the path's project file
    if [[ -n $A/*.xcodeproj(#qN) ]] ; then
      echo Opening project in: $1
      open -a Xcode.app $A/*.xcodeproj

    # Then, try an existing xcode workspace
    elif [[ -n $A/*.xcworkspace(#qN) ]] ; then
      echo Opening workspace in: $1
      open -a Xcode.app $A/*.xcworkspace

    # Check if the folder is a swift package
    elif [[ -f $A/Package.swift ]] ; then
      echo Opening package in: $1
      open -a Xcode.app $A/Package.swift

    # Check to see if the `x` tool has already been used in this folder
    elif [[ -d $A/.xcode/$basename.xcworkspace ]] ; then
      echo Opening folder: $1
      open -a Xcode.app $A/.xcode/$basename.xcworkspace

    # Lastly, create a new workspace and open it
    else
      echo Wrapping: $basename as $A/.xcode/$basename.xcworkspace
      mkdir -p $A/.xcode/$basename.xcworkspace/
      cat <<EOF > $A/.xcode/$basename.xcworkspace/contents.xcworkspacedata
<?xml version="1.0" encoding="UTF-8"?>
<Workspace
   version = "1.0">
   <FileRef
      location = "group:$A">
   </FileRef>
</Workspace>
EOF
      echo Opening folder: $1
      open -a Xcode.app $A/.xcode/$basename.xcworkspace
    fi

  else
    echo Not a file or folder: $1
  fi
}

for arg in "$@" ; do
  openItem $arg
done

if [[ "$#" = 0 ]] ; then
  echo 'An arg of $PWD implied when args are omitted'
  echo Use -h for more help
  openItem $PWD
fi
```

Any updates to the script can be found in my [dotfiles repository](https://github.com/p3l6/env/blob/main/bin/x).
