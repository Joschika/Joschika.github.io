#!/usr/bin/env bash
set -e
DATE=$(date +%Y-%m-%d)
read -p "Post title: " TITLE
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-\|-$//g')
FILENAME="_posts/${DATE}-${SLUG}.md"

cat > "$FILENAME" << 'TEMPLATE'
---
images: []
---

TEMPLATE

# append the title heading after the front matter
echo "# $TITLE" >> "$FILENAME"
echo "" >> "$FILENAME"

echo "Created: $FILENAME"
code "$FILENAME"
