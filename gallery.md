---
layout: default
title: Gallery
permalink: /gallery/
---

<link href="/css/override.css" rel="stylesheet" type="text/css">

<style>
  .lightbox {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    animation: fadeIn 0.3s ease-in;
  }

  .lightbox.active {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .lightbox-content {
    max-width: 90vw;
    max-height: 90vh;
    position: relative;
  }

  .lightbox-img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
  }

  .lightbox-close {
    position: absolute;
    top: -30px;
    right: 0;
    color: white;
    font-size: 32px;
    cursor: pointer;
    font-weight: bold;
  }

  .lightbox-close:hover {
    color: #ccc;
  }

  .gallery-img {
    cursor: pointer;
    transition: transform 0.2s ease;
  }

  .gallery-img:hover {
    transform: scale(1.05);
  }

  @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
  }
</style>

# Gallery

<div id="lightbox" class="lightbox">
  <div class="lightbox-content">
    <span class="lightbox-close">&times;</span>
    <img id="lightbox-img" class="lightbox-img" src="" alt="">
  </div>
</div>

<div class="gallery-container" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; padding: 20px 0;">
  {% for post in site.posts %}
    {% if post.images and post.images.size > 0 %}
      {% for image in post.images %}
        <div class="gallery-item" style="text-align: center;">
          <figure style="margin: 0; padding: 0;">
            <img class="gallery-img" src="{{ site.baseurl }}/assets/photos/{{ image }}" alt="photo from {{ post.title }}" style="max-width: 100%; height: auto; border-radius: 8px;">
            <figcaption style="font-size: 0.9em; color: #666; margin-top: 10px;">
              <a href="{{ post.url | relative_url }}" style="color: #333; text-decoration: none;">{{ post.title }}</a>
            </figcaption>
          </figure>
        </div>
      {% endfor %}
    {% endif %}
  {% endfor %}
</div>

<script>
  const lightbox = document.getElementById('lightbox');
  const lightboxImg = document.getElementById('lightbox-img');
  const closeBtn = document.querySelector('.lightbox-close');
  const galleryImages = document.querySelectorAll('.gallery-img');

  galleryImages.forEach(img => {
    img.addEventListener('click', () => {
      lightboxImg.src = img.src;
      lightbox.classList.add('active');
      document.body.style.overflow = 'hidden';
    });
  });

  closeBtn.addEventListener('click', () => {
    lightbox.classList.remove('active');
    document.body.style.overflow = 'auto';
  });

  lightbox.addEventListener('click', (e) => {
    if (e.target === lightbox) {
      lightbox.classList.remove('active');
      document.body.style.overflow = 'auto';
    }
  });
</script>
