---
title: Music Engraving
description: I have "in-housed" the musical engraving component of my bag notation tool.
date: 2026-10-27 10:30:00 -04:00
---

## External engraving

Whenever I have researched musical engraving, I have always found advice not to try to "roll your own", as it’s very complicated and has lots of edge cases. So, I have so far avoided doing just that, for my bagpipe notation format. Instead, it has used a rendering pipeline like:

1. Parse bag notation file
2. Output abc file
3. Call (modified) abcm2ps on abc file
4. Call ps2pdf on the ps file

This is a lot of steps, and requires dependencies to manage, and subprocesses to spawn. Additionally, tracing errors in later steps to their origin in the source file was very difficult if even possible.

Importing a library that does music engraving would have solved most of these issues. However, all of the existing ones I found lacked compatible licensing, or were JavaScript/web based, or generally outside the focus of this swift tool.

## Internal engraving

Bag notation's project philosophy is reducing the scope of musical notation. Taking inspiration from abc and other music-as-source-code languages, but simplifying the domain by making opinionated scope-cuts that serve the needs of bagpipes. So, the scope of musical engraving should be narrow as well. It was still too large a side project to begin. However, now the world has LLM coding agents.

This project is still one that I care deeply about the shape of the code in, so I did not want to turn it into a vibe-coded slop pile. But the LLMs can still be used for prototyping and scaffolding. After prototyping multiple strategies, and finding a proof of concept that worked, I started over and came up with a base rendering architecture that fit my vision of the project. I used agents in a loop of "scaffold" -> "refactor" -> "scaffold" -> etc. In each phase, I would end up completely refactoring the generated code, unwinding the over-engineering, re-architecting for the shortcuts, and general refactoring it until it felt right.

The final solution works like this:

* All lines and text are drawn with CoreGraphics, using a pdf drawing context.
  * This makes it not available on the linux build, which still needs the "legacy" pipeline.
* Used the Bravura music font to place the non-trivial elements.
* All metrics are now customizable on the page; to start with I’ve made it quite dense.

## Conclusion

While I still wrote all the end result code myself, this was not a project I could have written (in the same timeframe, or on the same budget, ie, none) without the aid of LLMs. LLMs are changing software development in a dramatic way, much of which worries me as far as the future of the craft. For this project, I still found all the satisfaction of shaping and bringing out the elegance of the code, by refactoring all the generated code by hand. However, this pace of work is quickly becoming unacceptable in the corporate world.

For the next step, I’m starting a new project to build a macOS document-based application to edit bag notation files, with a live preview (via the coregraphics rendering pipeline). For this, I plan to use LLMs in the modern way. Not quite vibe-coding, but doing human work at the level of requirements, architecture, and orchestration, delegating all code to the agent. It's entirely possible that this will produce a workable, if unmaintainable, solution[^1].

The future of software is uncertain, but I think the way of working will land somewhere between these two extremes. The question is: will the work still bring the same satisfaction as pre-LLM software development?

[^1]: As a result, this experiment may end up being discarded, and approached a different way.
