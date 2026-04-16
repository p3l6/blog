---
title: Misc commands
---

## Ripgrep <!-- Command -->

`rg` is a modern alternative to unix `grep`. [Github](https://github.com/BurntSushi/ripgrep).

## Fd <!-- Command -->

`fd` is a modern alternative to unix `find`. [Github](https://github.com/sharkdp/fd).

Examples:
* `fd name` A simple find of files in the cwd with name.
* `fd -e txt` Finds all files with extension txt.
* `fd -x cmd` Run a command with all matches, like `find ... | xargs ...`.
* `fd -X cmd` Run a command for each match, like `find ... | xargs -n 1 ...`.
* `fd -e py -X rg <regex>` Search python files for a regex.

## Sd <!-- Command -->

`sd` is a modern alternative to unix `sed`. [Github](https://github.com/chmln/sd).

Simple interface: `sd before after`

## Choose <!-- Command -->

`choose` is a modern alternative to unix `cut` or simple `awk`. [Github](https://github.com/theryangeary/choose). Install `brew install choose-rust`.

Examples:
* `choose 3` Selects column three.
* `choose 1:4` Column ranges, inclusive.
* `choose :3` Selects through column three.
* `choose -4:-1` Columns counted from the last.
* `choose -f ,` Change field separator, default whitespace.

## Exa <!-- Command -->

`exa` is a modern alternative to unix `ls`. [Website](https://the.exa.website).

Examples:
* `exa --l` Long format
* `exa --tree` A recursive tree view of all decendents.
* `exa --git-ignore` Excludes files ignored by git.
* `exa --git` Includes git statuses.
* `exa --extended` Includes xattrs.

## Zip  <!-- Command -->

* Zip a folder, including folder name: `zip -r <Archive.zip> folder/`
* List zip contents: `unzip -l <Archive.zip>`
  * Or, `zip -sf <Archive.zip>`
* Clean unwanted files: `zip -d <Archive.zip> __MACOSX/\*` or `zip -d <Archive.zip> \*/.DS_Store`
