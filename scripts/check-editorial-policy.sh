#!/bin/sh
set -u

status=0
forbidden='高信息密度|高密度|最短解|速查|最短判定链|最快解|快速判定'

if matches=$(rg -n "$forbidden" subjects --glob '*.tex'); then
  echo "Editorial policy violation: remove speed/marketing language from textbook prose:" >&2
  echo "$matches" >&2
  status=1
fi

if examples=$(rg -n '\\begin\{examplebox\}' subjects --glob '*.tex' | \
  rg -v '\\begin\{examplebox\}\[(原稿例|原稿型|原稿方法|补充)：'); then
  echo "Editorial policy violation: every examplebox needs an approved provenance label:" >&2
  echo "$examples" >&2
  status=1
fi

geometry_files=$(rg --files subjects -g '*geometry*.tex')
missing_diagrams=''
if [ -n "$geometry_files" ]; then
  missing_diagrams=$(awk '
    /\\begin\{examplebox\}/ { inside=1; start=FNR; diagram=0 }
    inside && /\\begin\{tikzpicture\}/ { diagram=1 }
    inside && /\\end\{examplebox\}/ {
      if (!diagram) print FILENAME ":" start ": examplebox has no TikZ diagram"
      inside=0
    }
  ' $geometry_files)
fi

if [ -n "$missing_diagrams" ]; then
  echo "Editorial policy violation: geometry examples require diagrams:" >&2
  echo "$missing_diagrams" >&2
  status=1
fi

exit "$status"
