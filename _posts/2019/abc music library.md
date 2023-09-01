---
layout: post
author: Paul
title: ABC Music Library
summary: Storing my music in a git repository.
date: 2019-11-1
---

Recently, I decided that personally typesetting all my bagpipe band music would be a good memory aid.
As a programmer, I wanted to combine this with natural source code tendencies. I think I ended up with a pretty neat system.
In the rest of this article, I will go over various parts of my system.

## Overview

The high level view of the project is a number of `.abc` files stored in a git repository with a makefile to generate pdfs.
This has the obvious advantages of source control and versioning that I have come to expect as given in my programming career.
It also has reproducibility: I prefer not to be at the mercy of WYSIWYG typesetting programs.

I used a makefile to keep things simple, and generate all the pdfs from source with only one command: `make`. There's nothing terribly clever about it, but that's the simplicity of make.

## Macros

To make things easier and more readable for setting bagpipe music, I layered another macro system on top of the abc file notation. Normally in abc, you specify gracenotes and movements by putting curly braces around them, ie `{GdGe}a`.
Due to the sheer number of gracings, I did not want to have to type so many gracings. Instead, I am able to set the first line of scotland the brave as:

```
[| xgA2 toarA>B dblcxeA dblce | dbla2 tapa2 gripae dblcxeA | trwd2 xgf>d dblce dblcxeA | dblB2 dble2 tape>f xge/>d/xgc/>B/ |
```

Here, things like `xg`, `toar`, `dbl`, `grip` all map to common piping grace note sequences. I define them in a macro file like this:

```
throw {Gdc}d
grip {GdG}
toar {GdGe}
```

I then have a rule in my makefile that replaces all the macros with their literal counterparts before sending to the abc processor.

```make
.build/%.abc: abc/%.abc .build/macros.txt
	@Echo "Removing ABC Macros from $<"
	@mkdir -p $(dir $@)
	@cp $< $@
	@while read n k; do sed -E -i.bak "s/$$n/$$k/g" $@; done < .build/macros.txt
	@rm $@.bak
```

I think this was the single biggest thing I did to improve my typesetting experience.

## Format

Another aspect of this project was creating a formatting file to give a similar look to the whole library. As this is a makefile dependency, it will also recreate the whole library when you make a change.

## Abcm2ps changes

In order to accomplish this, I did end up digging into the abc library, [abcm2ps](https://github.com/leesavide/abcm2ps). I added two parameters on my fork of this repo that I use in my format file.

One, `nowrap` disables all automatic line wrapping. Normally, the program will try to break lines on measures when they get too full, but that wasn't working for me. Bagpipe line density quickly filled up the lines and would not leave the standard 4 measures per line. However, the implementation for this turned into a bit of a hack and I am not confident that it will always work, or produce readable results. So it is not something I would recommend including in the upstream fork. However, it has been working for me, with everything I've tried to score so far.

Second, `flatbeamgracing` is an option very similar to the previous `flatbeams`, except that it only affects grace notes, and not others. This is consistent with how I expect pipe music to look, and I was already in a position to make it happen since I had built my fork as part of the makefile. This option could be a candidate to include upstream if anyone else were to be interested.
