#!/usr/bin/env bash
set -e

if [ -n "$1" ]; then
  PHOTO_DIR="$1"
else
  read -p "Path to photos folder: " PHOTO_DIR
fi

# Strip surrounding quotes (from drag-and-drop in terminal)
PHOTO_DIR="${PHOTO_DIR%\'}"
PHOTO_DIR="${PHOTO_DIR#\'}"
PHOTO_DIR="${PHOTO_DIR%\"}"
PHOTO_DIR="${PHOTO_DIR#\"}"

if [ ! -d "$PHOTO_DIR" ]; then
  echo "Error: '$PHOTO_DIR' is not a directory."
  exit 1
fi

IMAGES=()
for f in "$PHOTO_DIR"/*.jpg "$PHOTO_DIR"/*.jpeg "$PHOTO_DIR"/*.JPG "$PHOTO_DIR"/*.JPEG; do
  [ -f "$f" ] || continue
  BASENAME=$(basename "$f")
  cp "$f" "assets/photos/$BASENAME"
  IMAGES+=("$BASENAME")
done

if [ ${#IMAGES[@]} -eq 0 ]; then
  echo "No JPG files found in '$PHOTO_DIR'."
  exit 1
fi

echo ""
echo "Copied ${#IMAGES[@]} photo(s) to assets/photos/"
echo ""
echo "── Front matter (paste into images: field) ──"
echo "images:"
for img in "${IMAGES[@]}"; do
  echo "  - $img"
done

echo ""
echo "── Figure HTML (paste into post body) ──"
for img in "${IMAGES[@]}"; do
  printf '<figure>\n  <img src="{{ site.baseurl }}/assets/photos/%s" alt="" loading="lazy" style="max-width:100%%;" />\n</figure>\n\n' "$img"
done
