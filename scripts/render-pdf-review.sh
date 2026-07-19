#!/bin/sh
set -eu

pdf_file='output/pdf/main.pdf'
review_root='tmp/pdfs'

if [ ! -f "$pdf_file" ]; then
  echo "$pdf_file is missing; run make pdf first" >&2
  exit 1
fi

if ! command -v gs >/dev/null 2>&1; then
  echo 'Ghostscript (gs) is required to render review pages' >&2
  exit 1
fi

case $# in
  0) ;;
  2) ;;
  *)
    echo 'Usage: scripts/render-pdf-review.sh [FIRST_PAGE LAST_PAGE]' >&2
    exit 2
    ;;
esac

mkdir -p "$review_root"
review_dir=$(mktemp -d "$review_root/review.XXXXXX")

if [ $# -eq 2 ]; then
  gs -q -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -r110 \
    -dFirstPage="$1" -dLastPage="$2" \
    -sOutputFile="$review_dir/page-%03d.png" "$pdf_file"
else
  gs -q -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -r110 \
    -sOutputFile="$review_dir/page-%03d.png" "$pdf_file"
fi

if command -v montage >/dev/null 2>&1; then
  montage "$review_dir"/page-*.png -thumbnail 240x -tile 5x \
    -geometry +8+8 "$review_dir/contact-sheet.png"
fi

echo "Rendered PDF review pages: $review_dir"
echo 'Inspect them, then remove this temporary directory before handoff.'
