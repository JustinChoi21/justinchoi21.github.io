---
layout: publications
icon: fas fa-book
order: 6
---

## Publications

{% assign pubs = site.publications | sort: 'date' | reverse %}

{% if pubs and pubs != empty %}
	<ul class="list-unstyled">
	{% for pub in pubs %}
		<li class="mb-3">
			<h4>{{ pub.title }}</h4>
			{% if pub.author %}<div><strong>Author:</strong> {{ pub.author }}</div>{% endif %}
			{% if pub.translator %}<div><strong>Translator:</strong> {{ pub.translator }}</div>{% endif %}
			{% if pub.publisher %}<div><strong>Publisher:</strong> {{ pub.publisher }}</div>{% endif %}
			{% if pub.date %}<div><strong>Publication date:</strong> {{ pub.date | date: "%Y-%m-%d" }}</div>{% endif %}
			{% if pub.isbn %}<div><strong>ISBN:</strong> {{ pub.isbn }}</div>{% endif %}
			<p>
				<a href="{{ pub.url | relative_url }}">Read more</a>
			</p>
		</li>
	{% endfor %}
	</ul>
{% else %}
	<p>No publications found.</p>
{% endif %}





