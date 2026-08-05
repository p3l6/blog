---
title: Learning Ruby Scripting
summary: I spent some time learning a bit about ruby. I enjoyed it, and used ruby for a couple small tasks.
date: 2024-11-15 12:00 -0500
---

A while back I bookmarked a [blog post](https://lucasoshiro.github.io/posts-en/2024-06-17-ruby-shellscript/) advocating the ruby language as a go-to for shell scripting, in that it has value outside of rails. My takeaway was to try it as an option when typically I'd have gone to python or javascript. I had never really considered this, but I made note to give it a try someday. I do enjoy learning new tools.

Recently, I have had some time off work, where I was also too busy to work on any serious side projects. So I took some time to dive into ruby. I resonated with the points of the article, since I don't care for javascript at all, and python suffers from various problems, such as 2vs3 availability, virtual environments, and indentation. I wondered if ruby would be any different from these, when bash alone isn't an ergonomic option. I had also not really considered what tools I already use, that would be easier to interact with if I had some familiarity with ruby. Notably, these are jekyll, which powers this blog, and homebrew.

Here are some resources that I found and enjoyed while learning, aside from the initial blog:

* [Learn X in Y Minutes](https://learnxinyminutes.com/docs/ruby/). I recently discovered this site when looking for a summary of something else, and it has a pretty succinct overview for syntax of many languages and formats. I turned here first and skimmed through to get an idea. I expect to go back, to get an overview or quick reference for something else in the future.
* [Why's Poignant Guide to Ruby](https://poignant.guide/). I found this from the ruby website, when skimming the list of getting started materials. A bit long winded and rambling on topics, but amusing.
* [Ruby Koans](https://www.rubykoans.com). A series of examples laid out in the form of failing unit tests, that you must fix one at a time, guided by the console output. These were very fun examples, and just the right bite size chunks that I had time for. I was able to do a little bit a day, while making progress and seeing the concepts in action. I'd highly reccomend it.

As practical usage, I found a few, although not many places to insert ruby in my workflows.
I updated this blog repositor to use rake, which makes the most sense, since it is built with a ruby programalready.
I also converted my dotfiles task runner from a justfile to ruby. I was previously experimenting with `just` over `make`, and while it is very interesting, the computers I tend to use already have a ruby installed.
In retrospect, I probably should have used rake for this as well, since it ended up so similar. But I actually worked on it first, before learing how to use rake; and it was a practical example for using `.send()` on user supplied method names.

The biggest roadblock I encountered was while working on updating the blog. Similar to python, I ran into a problem of virtual environments.
MacOS still includes a system ruby version, but this seems unsuitable once you start trying to include any recent gems or dependencies.
For example, jekyll had crashes in dependencies when running on apple silicon. When I first tried to build the blog on apple silicon, I had just manually switched it to homebrew's cellar ruby, but this was only a bandaid since I was unfamiliar with the options.
During this excersize, I got it set up with rbenv, and locking the ruby verison.
So, this is a very similar issue to python, the need for virtual environments and custom interpreter versions per project.

Overall, I found very helpful resources and documentation, and enjoyed the experience going through it.
I'm not sure if I'll ever use ruby in a serious capacity, (ie something than a homebrew formula or jekyll plugin) as I do not expect to pick up rails. If I found myself needing to make a small server, I would want to use one of the server side swift stacks.
