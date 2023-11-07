---
title: Blog
---

[Subscribe (atom)](/feed.xml)
{:.text-right}

{% for post in site.posts %}

_[ {{ post.date | date_to_string }} ]_{:.text-sky-700}&emsp;
[{{ post.title }}]({{ post.url }})  
{{ post.summary }}

{% endfor %}
