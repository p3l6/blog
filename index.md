---
layout: default
title: Paul Landers
---

My name is Paul Landers, I live in Apex, NC.
This site is just a basic personal homepage, with information about myself and my personal projects and hobbies.
I am a professional software developer, and also enjoy playing the bagpipes and woodworking.

{% assign post = site.posts.first %}
## Latest Blog Post: [{{ post.title }}]({{ post.url }})
{{ post.summary }}

_{{ post.date | date_to_string }}_

{{ post.excerpt }}
[keep reading post]({{ post.url }})
