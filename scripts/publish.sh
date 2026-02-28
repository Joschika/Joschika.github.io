#!/usr/bin/env bash
set -e

echo "── Changed files ──"
git status --short

echo ""
read -p "Commit message [update]: " MSG
MSG="${MSG:-update}"

git add -A
git commit -m "$MSG"
git push

echo ""
echo "Published. Site will update in ~60 seconds."
