---
title: Development Reference
layout: page
---

This is a small collection of my snippets or cheat sheets for software development.
These can also [be downloaded as a docset](/assets/zips/Reference.docset.zip). (For use with [Dash.app](https://kapeli.com/dash))

## Topics

{% assign sub_pages = site.pages | where_exp: "item", "item.path contains 'dev/ref/' and item.title != page.title" | sort_natural: "title" %}
{% for sp in sub_pages -%}
* [{{ sp.title }}]({{sp.url}})
{% endfor %}
