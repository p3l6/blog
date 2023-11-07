---
title: Daily Standup tool
summary: An exploration in creating modern mac apps.
date: 2021-02-23
---

I have been fiddling with a daily standup tool over the last year or so, to keep track of what I do during the day. I use this as a draft, and then it auto-formats a post for the standup thread in slack. 

This tool directly relates to the method we use for standup on my team, so here's what we do. Instead of a more traditional short gathering, we use an asynchronous thread. We haven't found fancy tools that ask you questions to be flexible enough for us, so we just post text. First this was email threads, but more recently, it takes place in a slack channel. Each member posts a short message at the end of the day, so I have called the tool **Happy Hour**. Since happy hour is what happens at the end of the work day! Clever, I know.  (`hh` was the name of the original version of this tool, a command line script). 

In this message, we include sections, each with bullet points:
* Today: Things you have done today. 
* Tomorrow: Things you plan to do tomorrow. 
* QBI: An optional section for Questions, Blockers, and other Interesting things.

Happy Hour has a simple todo style list for each section. It functions as a "draft" for the daily post. In addition to the three sections above, it also includes a planned section. Any items in the Tomorrow section are automatically moved to Planned when the list is cleared. 

![The user interface of HappyHour](https://github.com/p3l6/HappyHour/raw/master/Screenshot.png)

One of the most important features, is that you can copy the formatted standup post to the clipboard. This adds an emoji bullet point for each item, makes headers bold, and creates hyperlinks; all in the rich text format, ready to be pasted into slack or email. 

In any field, if you enter something like `PR 1234` or `JIRA-567`, those will be automatically linked to the relevant issues or pull requests. Assuming the base urls are configured in preferences. 

I wrote this using SwiftUI for the Mac, because I wanted to get some more experience with it. It turned out to be a really simple way to get a clean Mac native appearance. Over this past winter, I have updated it to use all the new features for SwiftUI as part of Big Sur, including the new application lifecycle management. 

Here’s a [link to the code on github](https://github.com/p3l6/HappyHour), or straight to [the release download page](https://github.com/p3l6/HappyHour/releases/latest).
