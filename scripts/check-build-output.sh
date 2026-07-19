#!/bin/sh
set -u

log_file='output/aux/main.log'
pdf_file='output/pdf/main.pdf'
status=0

if [ ! -f "$log_file" ]; then
  echo "Build verification failed: $log_file is missing" >&2
  exit 1
fi

if [ ! -f "$pdf_file" ]; then
  echo "Build verification failed: $pdf_file is missing" >&2
  exit 1
fi

log_pattern='Overfull \\[hv]box|Undefined control sequence|Missing character:|LaTeX Error|Emergency stop|Fatal error'
if problems=$(rg -n "$log_pattern" "$log_file"); then
  echo 'Build verification failed: suspicious LaTeX log entries:' >&2
  echo "$problems" >&2
  status=1
fi

if ! command -v gs >/dev/null 2>&1; then
  echo 'Build verification failed: Ghostscript (gs) is required for PDF text proofreading' >&2
  exit 1
fi

text_file=$(mktemp "${TMPDIR:-/tmp}/schoolbook-pdf-text.XXXXXX")
trap 'rm -f "$text_file"' EXIT HUP INT TERM

if ! gs -q -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite \
  -sOutputFile="$text_file" "$pdf_file"; then
  echo 'Build verification failed: could not extract PDF text' >&2
  exit 1
fi

leaked_commands='qquad|cdots|(^|[^[:alpha:]])(quad|cdot|ldots|dfrac|tfrac|frac|sqrt|boxed|gtreqless|overrightarrow|textbf)([^[:alpha:]]|$)'
if leaks=$(rg -n -i "$leaked_commands" "$text_file"); then
  echo 'Build verification failed: probable LaTeX command leaked into PDF text:' >&2
  echo "$leaks" >&2
  status=1
fi

exit "$status"
