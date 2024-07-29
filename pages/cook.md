---
title: Recipes
permalink: /cook/
---

[Subscribe to new recipes](/feed/recipes.xml)
{:.text-right}

{% assign meals =  site.recipes | map: 'meal' | uniq %}
{% assign recipes =  site.recipes | sort: "title" %}

{% for meal in meals %}

## {{ meal | capitalize }}

{% for recipe in recipes -%}
{% if recipe.meal == meal -%}
* [{{ recipe.title }}]({{ recipe.url }})
{% endif -%}
{% endfor -%}

{% endfor %}
