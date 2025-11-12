---
title: projects
icon: fas fa-code
order: 1
---

## Projects

{% assign projects = site.posts | where_exp: "post", "post.categories contains 'Projects'" | sort: 'date' | reverse %}

{% if projects and projects != empty %}
{% for post in projects %}
- **{{ post.title }}**
	{% if post.date %}- {{ post.date | date: "%b %Y" }}{% endif %}
	{% if post.categories %}- Categories: {{ post.categories | join: ', ' }}{% endif %}
	- [Read more]({{ post.url | relative_url }})

{% endfor %}
{% else %}
No projects found.
{% endif %}
- [Read more](/posts/android-car-management-app/)

