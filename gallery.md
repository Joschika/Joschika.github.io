---
layout: default
title: Gallery
permalink: /gallery/
---

<link href="/css/override.css" rel="stylesheet" type="text/css">

# Gallery

<div class="gallery-container" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; padding: 20px 0;">
  {% for post in site.posts %}
    {% if post.images and post.images.size > 0 %}
      {% for image in post.images %}
        <div class="gallery-item" style="text-align: center;">
          <figure style="margin: 0; padding: 0;">
            <img src="{{ site.baseurl }}/assets/photos/{{ image }}" alt="photo from {{ post.title }}" style="max-width: 100%; height: auto; border-radius: 8px;">
            <figcaption style="font-size: 0.9em; color: #666; margin-top: 10px;">
              <a href="{{ post.url | relative_url }}" style="color: #333; text-decoration: none;">{{ post.title }}</a>
            </figcaption>
          </figure>
        </div>
      {% endfor %}
    {% endif %}
  {% endfor %}
</div>
