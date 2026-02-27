# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Jekyll-based personal blog/photography site hosted at **hunguido.org** via GitHub Pages. It uses the `minima` theme with custom overrides. The site is authored by Noah Royal.

## Local Development

To run the site locally, you need Ruby and Jekyll installed:

```bash
bundle exec jekyll serve
```

The site will be available at `http://localhost:4000`. GitHub Pages automatically builds and deploys on push to `main`.

## Content Structure

### Blog Posts (`_posts/`)
Posts follow Jekyll's naming convention: `YYYY-MM-DD-title.md`. Each post uses front matter to declare images for the gallery:

```yaml
---
images:
  - filename.jpg
  - another-photo.jpg
---
```

- Posts with `images: []` or no `images` key won't appear in the gallery
- Images embedded directly in post body use GitHub CDN URLs or the local path pattern: `{{ site.baseurl }}/assets/photos/filename.jpg`
- Posts with local photos should use both the front matter `images` list (for gallery) and `<figure>` tags in the post body

### Photo Assets (`assets/photos/`)
Local photos are stored here and referenced in posts. The gallery at `/gallery/` auto-populates from all posts' `images` front matter.

## Key Architectural Patterns

### Gallery System
`gallery.md` iterates over `site.posts`, collects all images listed in each post's `images` front matter, and renders them in a CSS grid with a JavaScript lightbox. Clicking a gallery thumbnail opens a full-screen overlay.

### Post Layout (`_layouts/post.html`)
All posts use the `post` layout which:
1. Includes `sharelinks.html` — social sharing buttons (Facebook, Twitter, LinkedIn, Google+, email)
2. Includes `navlinks.html` — previous/next post navigation at the bottom; falls back to the archive page if no adjacent post exists

### Custom CSS (`css/override.css`)
Loaded explicitly in posts and gallery via `<link>` tags (not via `_config.yml`). Styles post navigation links and HR spacing.

### Archive (`archive.md`)
Groups all posts by tag. Posts default to the `Other` tag (set in `_config.yml` defaults) unless a different tag is specified in front matter.

## Site Configuration

- **Theme**: `minima`
- **Plugins**: `jekyll-feed`, `jekyll-sitemap`
- **Syntax highlighting**: disabled via kramdown config
- **Title stripping**: enabled via `titles_from_headings` (strip_title: true) — the H1 in post body won't duplicate the page title
