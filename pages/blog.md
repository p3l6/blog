---
title: Blog
permalink: /blog/
---

[Subscribe (atom)](/feed.xml)
{: style="text-align:right" }

{% for post in site.posts %}

[{{ post.title }}]({{ post.url }}){: style="color: var(--heading-color)" }
*/ {{ post.date | date_to_string }} /*{: style="float: right"}

{{ post.summary }}

---

{% endfor %}
