---
title: New Blog Theme
summary: I wholistically updated the blog's style and layout.
date: 2023-11-21 21:00 -0500 
---

My blog site has gotten a complete do-over, a new layout, fonts and theme.
I replaced the imported jekyll theme, and wrote a custom layout using tailwind css. 
I had never used tailwind before, and used this opportunity to explore some new technologies.

## Style

A while back I revisited a bookmarked a blog post, likely about native macOS developer tools, although I cannot remember.
It was a post on [Chris Krycho's blog](https://v5.chriskrycho.com). 
It's actually a really good blog for content, here are a couple of posts interesting to me: 
[Stay Curious About Your Tools](https://v5.chriskrycho.com/journal/stay-curious-about-your-tools/),
[Reflections on a Month with BBEdit and Nova](https://v5.chriskrycho.com/journal/reflections-on-a-month-with-bbedit-and-nova/),
[My Current Mac Stack](https://v5.chriskrycho.com/journal/current-mac-stack/), 
and [Writing Tools](https://v5.chriskrycho.com/journal/writing-tools/).

While I was reading a number of his posts, I also found that I really liked the style. It inspired this round of theme updates, and I have drawn quite blatantly from that example.

## Fonts

Revisiting the entire site's theme would not be complete without changing out the fonts.
I knew I wanted to use Fira Code for my code snippets, as I have been using it for a long time in my editors.
I didn't do anything too fancy for the others, just scrolled through google fonts until some interesting ones came up. 
Of course, the first people I showed these fonts to commented it was too extreme! So I went back to google and found some more normal ones. 
I think these, "Comfortaa" and "Spinnaker" are alright, but may end up changing them later. 

## Static sites

This site has always been built with Jekyll, since github publishes it be default for github pages.
However, I know that many newer static site generators exist now.
I researched a few at [JamStack](https://jamstack.org/generators/), but ended up deciding to stick with Jekyll. 
One of the most notable, was [Publish](https://github.com/JohnSundell/Publish), a static site generator based on swift. I explored this quite a bit, but in the end felt that it had too much customization for what I need here.

However, I did eject from the built in github pages compiler, to get an updated jekyll version and allow plugins. GitHub pages has a list of dependencies that are available on the build image, but doesn't allow importing others, or bundling custom ones.
It was fairly easy to mimic what was already happening in an action. The only custom plugin I ended up with removes the dates from the post file names. I have always thought that was quite redundant, if you can put a published date in the front matter. 

## Tailwind

One of my biggest pet peeves with web development is CSS. I have never taken the time to learn it properly, and it is full of tricks and pitfalls.
So I had it on my list to check out Tailwind. Jekyll already has support for Sass built in, but that is a much thinner abstraction. 

So, I used tailwind to style all the templates. I have quite enjoyed it; especially having all the style inline in a single file, not having to cross-reference classes between the html and css.

The biggest benefit was that tailwind comes with modern concerns included: dark mode, responsive breakpoints, article typography, etc. 
The way properties are overridden for these cases were simple to understand (just add `dark:` for example), with whatever gotchas already handled by the framework. 

One last cool thing I learned about while working with tailwind was about kramdown's attribute list definitions. While not technically related to tailwind at all, I did not know they existed despite these markdown files already being processed with the kramdown parser.
These let you put lightweight style information into the markdown files, without dropping down to the html layer. 
