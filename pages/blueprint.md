---
title: Blueprint
---

This is a description of how my blog is designed, written, and published.
Sometimes this could be called a colophon.

## Privacy

This site does not track, store, transmit, or collect any of your data or personal information.

## TLDR

I use markdown files, with a static site generator, to create plain html files.
Those html files can be served by any static web host, without any server side logic or rendering.
The static pages are re-rendered whenever a commit is made to the git repository.

The site is intended to resemble the default format of latex documents, which has a nostalgic element for me.
I gained an appreciation for latex during my applied mathematics degree; during which all tests, assignments, and reports were encouraged to be typeset with latex.
I quickly abandoned Word and other WYSIWYG editors as much as possible. A preference I still hold today.

## Built with

* [Jekyll](https://jekyllrb.com): This is static site generator used by default on GitHub Pages. This site has since overridden that default, to use a newer version and include custom plugins, which the github pages auto-builder does not allow.
  * [Kramdown](https://kramdown.gettalong.org/quickref.html): An included markdown renderer in jekyll. It has some neat extensions that allow setting classes and other html key-value pairs to a markdown block.
  * [No-date plugin](https://github.com/p3l6/blog/blob/main/_plugins/no_date.rb): A simple jekyll plugin that overrides the requirement to start all blog posts filenames with a date. This seems superfluous to me since I'm already setting the date in the front matter. It became annoying since I rarely publish a post the same day I start it.
* [LaTeX.css](https://latex.vercel.app): The theme used as a base for the content. I adapted the whole-page to apply to my inset content, while keeping a custom navigation sidebar.
* [GitHub Pages](https://pages.github.com): Github pages is a static page hosting service; it serves the Jekyll output from the markdown pages stored in the repository.
* [Repository](https://github.com/p3l6/blog): The repository containing all the content, and history, for this blog.

## Fonts

* [Latin Modern](https://en.wikipedia.org/wiki/Computer_Modern#Latin_Modern): Used for body text and headers. A modern-font-format implementation of "Computer Modern", the default tex font created by Donald Knuth.
* [Fira Code](https://github.com/tonsky/FiraCode): Used for code blocks and monospace. I started using this font for the ligatures, and while there are other fonts now with similar programming ligatures, I had already come to appreciated some of the quirks of Fira Code. So, I use it in all my text editors now.

## Layout and colors

The current layout for this blog was _heavily_ inspired by another blog, [Sympolymathesy](https://v5.chriskrycho.com). Thank you, Chris, for the inspiration.
I borrowed the aesthetic, and derived the appropriate css for myself, adding my own personal fonts and colors.

The colors come from the [Tailwind color palette](https://tailwindcss.com/docs/customizing-colors), since I was using tailwind to generate css at the time I adopted this layout.
The code block colors are adapted from Xcode's default color scheme.

## License

This entire blog, which is for the most part text, but also includes some generation code, is provided under a Creative Commons license. See the [repository license file](https://github.com/p3l6/blog/blob/main/LICENSE) for more details.
