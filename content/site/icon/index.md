---
title: Icon
description: The boat logo used on this site, and as my profile avatar
---

{% assign images = site.static_files | where_exp: "item", "item.path contains 'assets/icon' and item.extname == '.svg' or item.extname == '.png'"  %}
{% for image in images -%}
* [{{ image.name }}]({{image.path}})
{% endfor %}


could include svg source here as a resourece?

// :TODO: enumerate these
[boat](boat-circle.svg)
