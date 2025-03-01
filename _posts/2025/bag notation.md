---
title: Bag Notation
summary: An status update on my bagpipe music notation language
date: 2025-02-28 20:00 -0500
---

I have made some progress on my bagpipe musical notation language and software, since my last update here.
Firstly, I am now calling this file format Bag Notation, when previously I had not chosen any name for it.
It is now in a stable and usable state, open source and installable via homebrew.

You can install it right now (on mac or linux) with `brew install p3l6/tap/bag-notation` and read the [language documentation](https://github.com/p3l6/bag-notation/blob/main/Documentation.docc/Language.md). For the rest of the post, I'll share about the project goals, history, and status.

## Example

Here's a sample of what a full tune looks like in bag notation.

```
---
title: Scotland the Brave
trad
style: 4/4 March
---

|| xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza  | vb+ xxe+ te.f/ xe/.d//xc/.b// |
   xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza  | vb+ xa.b/ ta+ xxce           ||
|| xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ xxh.g/ | xfh tgf xed xxcb              |
   xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza  | vb+ xa.b/ ta+.               ||
```

The theme notes are represented by the letters `l a b c d e f g h`, where l = low g and h = high a. Notes are assumed to be eighths, unless modified by one or more of `+ / .`, which double, half, and dot notes, respectively. All the other letters are part of the "semantic gracenote" system, as described in the documentation.

## How It Started

Years ago, I started on a simple initiative to create some piping scores with abc notation.
I hit an immediate pain point involved with describing grace notes, notably the abundance of curly braces, and ease of making mistakes.
So, I created a simple bash script that would run a series of `sed` commands, making replacements like `taorA -> {GdGe}A`.
I even made a [blog post](/2019/11/01/abc-music-library/) at this stage in the process.

Eventually that script was refactored into python tool, and later again in typescript.
Each of these iterations added slightly more shorthand, and features, but were still tightly coupled with abc notation.
However, this allowed me to compile a personal git repository of every tune I had ever learned, all of which could be compiled to pdfs using a makefile to orchestrate the `script.py -> abcm2ps -> ps2pdf` pipeline for each tune.
This was a big milestone and I was quite happy with it, having everything digitally archived instead of a folder of old pieces of paper made it durable, searchable, and frankly helped with memorizing new tunes.

All of the solutions so far were still essentially based on regexes to find and replace.
This constraint was a natural cliff in how far I could deviate from the abc notation it was coupled with.
I decided to back to square one, taking everything I had learned so far, and design a new language. I could make this anything I wanted without consideration for abc compatibility.
This was the formation of what is now bag notation.

I started a new rewrite of the tool, this time aiming to make a language parser, instead of a fancy collection of regexes.
One of the biggest changes was "semantic gracenotes". This allows gracenote symbols to adapt to either the pitch that comes before or after.
For example, this allows `x` to mean "use a canonically appropriate gracenote that is a higher pitch than the following note", and let the compiler choose if that implies a high-g or a high-a, based on the context.
Another choice was to use all lowercase letters, as I felt that typing abc suffered from requiring capitals to disambiguate octaves.

## How It's Going Today

* The bag notation compiler is a CLI tool written in swift.
* After parsing a `.bag` file,
    * It can output abc
    * It can auto-format, which aligns the pipe characters on consecutive lines.
    * It can output pdf, currently by utilizing the same pipeline as before on top of the abc representation.
* There is documentation about the language itself.
* There is a vscode extension with syntax highlighting, although it is an approximation and I don't plan to improve it.
* The tool can be easily installed on mac and linux via homebrew, which also installs the dependencies for pdf output.
* I've converted my whole local repo to the new format; additionally I have repo for our current band repertoire that automatically creates pdfs and publishes them on commits.

## Future Goals

I am very happy with where to project is, and what I can accomplish with it. But I do still have some plans for near term improvements.

First up, I'd like to make an extension for the Zed editor.
I have started using this editor over vscode lately, so this is a much higher priority than fixing the vscode extension.
I expect it will have syntax highlighting at least, but am hoping to stretch the goal and have some kind of inline help or compile actions.
Since my parser is based on tree sitter, and so is Zed's plugin system, I am optimistic about this; and wary about the stretch goals requiring a language server.

The biggest remaining piece is to investigate compiling straight to a pdf, without going to the abc intermediary notation.
Ideally, I'd be able to ship a single binary for this, as the current homebrew dependencies take a long time to install in CI.
Also, having direct control over the pdf formatting could allow more possibilities for making traditional piping scores.
However, as far as I can tell, this is going to be rather difficult. All tools I have yet found for creating music scores are either proprietary, or GPL.
And even with reduced scope of bagpipe usage, creating a music engraving system from scratch is far outside the scope of what I believe I can accomplish in this side project[^1].

## Summary

It's been a long time in progress with many stages, but I am very pleased to release the bag notation language.
It is working great for my personal use case, I can type up a new tune very quickly, with a low rate of errors.
I do doubt it will get much traction in the wider community, but I would love to hear from anyone interested in it.

[^1]: I was at one point planning a macOS editing app for these files, with a live preview, but had to shelve it for the same reason.
