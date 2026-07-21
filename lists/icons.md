---
title: Icons
---

{% assign images = site.static_files | where_exp: "item", "item.path contains 'assets/icon' and item.extname == '.svg' or item.extname == '.png'"  %}
{% for image in images -%}
* [{{ image.name }}]({{image.path}})
{% endfor %}
