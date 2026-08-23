---
title: Site Upgrades
description: Over the summer, I have made some substaintial upgrades to the website.
date: 2026-08-22 22:00:00 -04:00
---

## A New Website Address (Again)

I know I've done this quite a few times before.
And I always think it will be the last time, but it has not been.
Maybe `ers.land` will be my final blog url? I guess I can't say for sure.

For a while, I had become less than happy with `p3l6.dev`, for a few main reasons: The numbers, lowercase ambiguity, unclarity to non-tech folks.
Very few other blog urls or urls in general use numerals, most stick to just letters, which in fact was one reason this label was not in use at all.
I'd often worry that the lowercase `l` would be read as a `1`, even so far as that I actually registered `p316.dev` as well. This ambiguity especially would bother me during job searches when I'd be expecting people to be able to find my resume easily.
To the same end, it was also difficult to spell out loud or over the phone.
Lastly, I'd constantly have to explain `kubernetes -> k8s` type abbreviations to non-tech folks if they were interested in what the url meant.
Ironically, [my last post on this topic](/blog/2023/blog-rebranding) was very excited about `p3l6`, and so I do plan to keep using it for usernames on other websites.

A while back I picked up `ers.land`, mainly because it made a nice email (paul@ers.land).
I like that it is as succinct as possible, while still containing my whole name!
After sitting on it for a while, I decided that it would make a great primary blog url too, it matches all the criteria that annoyed me about the previous one: obvious meaning, short, easy to spell and read, no numbers.
Of course, making that decision opened up a whole can of worms that I would need to work through first!

## A New Logo

One main blocker to move to the new address was the icon, which was just a wordmark for p3l6.
If I moved the address, I'd want a more fitting icon to the new site.
And why should the icon be tied to the site address, anyway? This made it unsuitable for "profile icons" or "avatars" elsewhere.
I wanted to make something that could be both, the site icon and a universal avatar.

{{< figure
  src="/images/logos/p3l6.svg"
  alt="P3L6 wordmark"
  caption="P3L6 wordmark"
  class="inline double"
>}}
{{< figure
  src="/site/icon/boat-round.svg"
  alt="A boat"
  caption="New boat icon"
  class="inline double"
>}}

I sketched a lot of different ideas, but in the end I went with this boat.
It is based on an art project I did in high school, which was in turn based on a symbol from the banner associated with the Scott's confession of faith.
I used a vector sketching app for iPad to get my rough ideas out, but then created similar svg paths manually in plaintext.
Here's an example, the sail portion of the icon:

```xml
<!-- sail -->
<path
  d="M 25 8
     C 34 3 58 6 64 9
     C 70 12 68 40 62 43
     C 60 30 40 30 20 43
     C 50 15 16 13 25 8 Z"
  stroke="#2A2E33"
  stroke-width="0.5"
  fill="url(#sail-gradient)"
  stroke-linejoin="round"/>
```

## Hugo

Since I was making such broad changes, I revisited a previous investigation into alternative static site generators, besides jekyll.
Jekyll had been in use since the origins of the website, as that is the default for github pages.
Even though I'd upgraded to a newer version than the one pinned to github's default, I still felt like I was pushing at the boundaries.

I investigated some different options, before deciding to do a deeper dive into [Hugo](https://gohugo.io).
This is the most popular generator[^1] that is not based on some kind of javascript.
One of the things that I appreciated about Jekyll was not having to be have a node setup to use it (I did end up having similar version/dependency issues with the ruby installation of Jekyll, though).

Migrating to Hugo was a bit of a learning curve; here's some of good things about it:

* Single binary install, no dependency or virtual environment management.
* A better folder layout. This was my main complaint with Jekyll: the collection folders (ie `_posts/ _sass/ _recipes/`) made a lot of clutter, and the content did not match it's own url structure. Instead of Jekyll's "blog-aware", Hugo makes it easy to enumerate subcontent from any particular folder.
* Markdown improvements: more supported with newer features and better customization hooks. Such as callouts/admonitions, marks, alignment with github-flavored-markdown.
* While the concept of sections was hard to understand at first, it is very powerful. It does mean that in practice I have more layout files than I did before, and yet the whole site is more cohesive in theme, as an page can be a "section" or listing of the descendent pages.
* The base language is golang. In practice this didn't affect me (as I don't know much golang) other than learning the go template format, which is different but more capable than the Jekyll templates.
  * One oddity is that by default, templating cannot go into content pages. This is a safety feature that can be turned off for single author sites, but I left it on anyway as it seemed to force better habits of separating page design from content.
  * Since the site didn't rely on ruby anymore to run, I also migrated the rakefile to a [taskfile](https://taskfile.dev). While similar, this file describes the tasks in yaml, similar to CI workflows. I had not used it format before, but it seems good for a basic command runner, and aligns with Hugo on golang.


## Layout Changes

As noted above, hugo allows all content to exactly match it's final url destination.
In addition, any folder can become a section, where subpages are enumerated as a list.
So I took this opportunity to move and restructure a lot of the content.

Much of the content was not actually even accessible from the site menu previously, because there was so much miscellaneous.
I made an effort to regroup everything into logical[^2] paths, and align the menus to this structure.
In addition, the menu now supports two layers, so section pages like [Hobbies](/hobby) will display their sub-sections in the main menu.

Hugo also made it easy to add breadcrumbs to the top of the site, instead of a hack I was using on the previous site to add the parent link into specific content, ie blog articles and recipes.

## Combining Subscription Feeds

Since there was already a lot of churn, and the atom rss feed was getting a new template and url anyway, I've combined the previous two feeds for blog and recipes together.
I'm not sure if jekyll would have supported this, but Hugo is quite flexible.
Even though my url was changing, I did not want the feeds relative url to change, it needed to stay `/feed.xml`.
Last, by default hugo generates RSS feeds and jekyll was generating an Atom feed. I wanted to keep that too, so I ended up with a custom template for the feed.

This did take quite a bit of configuration[^3] though, here is everything I had to set to get it working (in addition to the template file)

```yaml
mainSections:
  - blog
  - cook

mediaTypes:
  application/atom+xml:
    suffixes:
      - xml

outputFormats:
  ATOM:
    mediaType: application/atom+xml
    baseName: feed

outputs:
  home: ['html', 'atom']
  page: ['html']
  section: ['html']

services:
  rss:
    limit: 16
```

[^1]: According to [Jamstack's](https://jamstack.org/generators/) sortable list of generators, which is based on number of github stars.
[^2]: Logical to me, in any case.
[^3]: Hugo advertises as minimal configuration required. This did turn out to be true, as configuring this non-standard feed represents one third of the whole configuration file!
