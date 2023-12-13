---
title: Trivia Tracker App
summary: An iOS app for counting your play-along Jeopardy score.
date: 2020-11-20
---

During the 2020 Pandemic Lockdown, one of the projects I embarked on was to create an app to keep track of responses while watching an episode of Jeopardy.
This was inspired while binge-watching Jeopardy re-runs on Netflix with my wife.

Even more, I wanted a experimental project to improve my familiarity with Apple's new SwiftUI.
It seemed really neat when they announced it, but I had yet to find a project to try it out on iOS.
Turns out, its pretty great!
A few kinks left to iron out in future versions, but no showstoppers.
It is a huge improvement on XIBs and interface builder.

For the most part, development in SwiftUI was enjoyable!
The biggest caveat I found was some issues with `.actionSheet` on iPad.
Probably related to my specific use case:
* I have many many text fields in a grid, all with an associated actionSheet.
* They all respond to tap gestures instead of being actual buttons, which is workaround for another issue I ran into - couldn't detect long taps on a Button.
* The result was clicking in the background to hide the action sheet not working correctly, and actually trying to activate the new sheet from whatever box was tapped in the background.

I spent a few sessions trying to work around these issues. In the end, I just disabled the `.actionSheet` functionality while running on iPad.
This was disappointing, but there is only so much effort I am willing to put in for hobby projects.
Falling back to UIKit to implement this feature was not part of my project goals.
Hopefully, I will be able to re-enable this in a future version.

I worked on this here and there for quite a few months, wrapping up in November.
I finished up the same week that Alex Trebek, longtime host of jeopardy, lost his long battle with cancer.
He will be greatly missed by all fans of Jeopardy; I don't know how jeopardy can ever be the same without him.
I'm sure they will find a new host after some time, and my vote would be for Ken Jennings, as if anyone was asking _me_.

I doubt many other people will be interested in this app, and that isn't really why I made it.
But I've [listed it anyway in the app store](/projects/triviatracker) for the lowest price of $0.99.
If others are interested, perhaps that can offset the cost of the Apple developer subscription.
Apple also just announced that they are lowering their commission rate on app purchases; that is great news for small developers, but I doubt it will have much impact here.

There are of course a few features I hope to add to the app in the future (ie daily doubles), but I'm very happy with how it turned out!
