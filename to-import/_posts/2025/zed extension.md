---
title: Zed Extension for Bag Notation
summary: The zed extension for bag notation is available, in developer mode.
date: 2025-03-22 22:00 -0400
---

In my [last post](/2025/02/28/bag-notation/), about the bag notation language, I mentioned that one of the next tasks was to create an extension for the zed editor. I have finished a first version of this, and it can be installed locally in developer mode.

## Features

The feature set, if it can be called a set, is just the basics. It has syntax highlighting and a couple tasks. The syntax highlighting relies on the same tree-sitter definition the actual parsing tool, so it is correct, and won't drift as changes happen to the format. The helper jobs are wrappers for `bag pdf` and `bag format -i` for the currently opened file.

## Installation

As it is such a niche tool, it is not submitted to the small set of official zed extensions. Instead, it has to be installed as a developer extension. You can do this by cloning [the repository](http://github.com/p3l6/bag-notation) and then, from zed, opening the `./zed-extension` folder as a developer extension.

Also, the extension doesn't install the actual parsing tool, that must be done manually. As in the previous post, it can be installed with `brew install p3l6/tap/bag-notation`.

## Learnings

While I was initially optimistic about incorporating my existing tree-sitter definition into the zed extension, it turned out to be fairly tricky to do. This was mostly due to zed expecting the tree-sitter to be in it's own repository. However, I am trying to keep the parser, tree-sitter, and extensions all in a single mono-repo (at least for now).

Eventually, it was working by recursively checking out the repository inside itself, and pointing zed at a subdirectory inside the nested clone. So, not ideal for many reasons.

Also, I would have expected the query files to be reused, if packaged inside the tree-sitter definition, but no, zed expects them to only be inside the extension itself. Since I have a mon-repo for this, I have symlinked them together for now.

Other than these gotchas, creating the zed extension was fairy simple, largely a matter of implementing the relevant tree-sitter queries.

## Next steps

If I have time to continue working on this, the next step would be to investigate language server support in the parser binary. This would surface errors and autocomplete information to the zed editor.
