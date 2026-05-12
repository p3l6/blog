---
title: WWDC and Other Apple Event Notes
layout: page
---

{% assign years =  site.wwdc | map: 'year' | uniq | reverse %}
{% assign events =  site.wwdc | sort_natural: "title" %}

{% for year in years %}

## {{ year }}

{% for event in events -%}
{% if event.year == year -%}
* [{{ event.title }}]({{ event.url }})
{% endif -%}
{% endfor -%}

{% endfor %}
