---
title: New RSS Feed for Recipes
summary: I added a second feed, just for new recipes.
date: 2024-01-09 03:00 -0500
---

I am a big fan of getting news and updates in an RSS reader. My current daily driver is NetNewsWire.
As such, it has always been important to me that the posts on this small blog were available in such a feed. Fortunately, this is easy with Jekyll; and it turns out that so is adding additional feeds.

The new feed can be found at [/feed/recipes.xml](/feed/recipes.xml). It will update when new recipes are added to the collection I [keep on this site](/cook/)[^1].

Both feeds are produced by the [jekyll-feed](https://github.com/jekyll/jekyll-feed) plugin.
Since I already stored all the recipes in a collection in the `_recipes` folder, enabling the feed was a simple configuration change:

```yaml
feed:
  collections:
    - recipes
```

The only trouble with this was that I was not tracking dates for any of the added recipes, so the feed items would be generated in an unpredictable order. I tried to use a git command to determine when the recipes were added, but this was unhelpful since I imported most of them on the same date. But, I came up with approximate dates for enough of the older ones to push the most recent to the top of the list, by looking in the previous notes application as well.

```zsh
for file in *; do
  echo -n "$file\t\t"
  git log --follow --format=%ad --date short $file | tail -1
done
```

[^1]: That is to say, every recipe I bother to keep track of at all. I don't have any other recipe storage notes anymore, everything goes here.
