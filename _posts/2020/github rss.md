---
title: Github as an RSS manager
summary: Syncing feed lists stored in a github repository.
date: 2020-05-12
---

I converted what was my RSS subscription list backup to be the source of truth instead.

On my Mac, I use [Reeder](http://reederapp.com) for keeping up with RSS feeds. 
Until now, I had been using the local subscription mode, with no cloud syncing or anything fancy. 
Instead, I would routinely use the "export to OPML" feature to store a backup of my subscriptions in my [github dotfiles repo][1].

Now, I have started using [inoreader](http://inoreader.com) as a cloud service, which integrates nicely with Reeder for reading on the desktop.

## OPML files
The backups were stored in an OPML format. After looking at what was being exported, and searching online to find very old spec documents, I manually edited the file to be more easily maintainable. I reduce a couple fields I did not thing were necessary, and standardize the order of fields in the file. 
For example, entries in the xml document might look like this
```xml
<outline type="rss" 
  text="Apple Newsroom" 
  xmlUrl="https://www.apple.com/newsroom/rss-feed.rss" 
  htmlUrl="https://www.apple.com/newsroom/"
/>
```
The fields here are
- `text` the feed title
- `xmlUrl` the feed location
- `htmlUrl` which refers to the homepage of the blog that a browser might view.

There is also a header and footer in the file, which I compressed onto a couple lines to keep it out of the way.
```xml
<?xml version="1.0" encoding="UTF-8"?>
<opml version="2.0"><head><title>RSS</title></head><body>
 ... feed subscriptions ...
</body></opml>
```

## inoreader
I looked at a few cloud RSS aggregators, but chose inoreader for two main reasons:
1. It integrated with Reeder
2. It has a feature called _OPML subscriptions_

The idea behind these _OPML subscriptions_ is that Bob would publish a list of feeds online that he reads. Alice, then, would subscribe to Bob's feeds, and be kept up to date whenever Bob adds something new. In this case, I am acting as both parties, by subscribing to my own OPML files. 

For this to work, I split out my single long subscription list into a handful of smaller ones.
Each one represents a folder that I was previously using, along with a catch-all called "Assorted". You can see the current list of folders in [the repository][1]. While the OPML format does allow folders of feeds to be specified, the _OPML subscriptions_ feature squashes all the feeds from a single subscription into a single folder. 

This process must then be completed for each folder:
1. In inoreader settings, navigate to _import/export/backup_
2. Find the button to add a new _OPML subscription_ and click it
3. Use the url for the raw GitHub content: 
```
https://raw.githubusercontent.com/<user>/<repo>/master/<path>/<file>.opml
```
4. Enter a new folder name, matching the OPML file name
5. Use full synchronization (to unsubscribe when a feed is removed from the source)
6. Uncheck notify when updated (since I'm subscribing to my own feeds, I already know when they update)

## Adding a new feed
The positive upshot of all this is that I can now subscribe to new feeds (or remove stale ones)
by changing a small amount of plain text in my [dotfiles repository][1], and have it propagate to my client. 
In the process, I have made sure that my list of subscriptions will always be up to date; 
and as a bonus of the cloud, my unread indicators will sync across multiple devices. That's great, as one of the main goals
of having a dotfiles repository is environment syncing!

## Final thoughts
While (un)subscribing to feeds is something I do very infrequently, 
it was still very pleasing to me to have this work out in such an elegant way.

I have also noticed that the Reeder client does a better job rendering a few feeds when they go through inoreader, as opposed to standard RSS. I can't really explain that, but it has been nice too!

[1]:https://github.com/p3l6/env/tree/master/export/rss
