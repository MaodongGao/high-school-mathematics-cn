#!/bin/sh
set -u

catalog='sources/catalog.csv'
exemptions='sources/audit-exemptions.txt'
status_code=0
header=1

is_exempt() {
  source_id=$1
  [ -f "$exemptions" ] && rg -q "^${source_id}([[:space:]]|$)" "$exemptions"
}

check_audit_rows() {
  audit_file=$1
  awk -F '|' '
    BEGIN { rows=0; bad=0 }
    /^\|[[:space:]]*[^-]/ {
      page=$2; state=$4; reason=$5
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", page)
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", state)
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", reason)
      if (page == "PDF 页" || page == "") next
      rows++
      if (state !~ /^(已收录|合并整理|待收录|暂缓|有意不收录)$/) {
        print FILENAME ": invalid audit status on page " page ": " state > "/dev/stderr"
        bad=1
      }
      if (reason == "") {
        print FILENAME ": missing handling/reason on page " page > "/dev/stderr"
        bad=1
      }
    }
    END {
      if (rows == 0) {
        print FILENAME ": audit has no page rows" > "/dev/stderr"
        bad=1
      }
      exit bad
    }
  ' "$audit_file"
}

while IFS=',' read -r subject source_id relative_path source_status target notes; do
  if [ "$header" -eq 1 ]; then
    header=0
    continue
  fi
  [ -n "$source_id" ] || continue

  case "$source_status" in
    unreviewed|sampled) ;;
    transcribing|review|complete)
      audit_file="sources/${source_id}-example-audit.md"
      review_file="sources/${source_id}-review-notes.md"

      if is_exempt "$source_id"; then
        continue
      fi

      if [ ! -f "$audit_file" ]; then
        echo "$catalog: $source_id is $source_status but $audit_file is missing" >&2
        status_code=1
      elif ! check_audit_rows "$audit_file"; then
        status_code=1
      fi

      if [ ! -f "$review_file" ]; then
        echo "$catalog: $source_id is $source_status but $review_file is missing" >&2
        status_code=1
      fi

      if [ "$source_status" = 'complete' ]; then
        if [ -f "$audit_file" ] && unresolved=$(rg -n '\|[[:space:]]*(待收录|暂缓|部分收录)[[:space:]]*\|' "$audit_file"); then
          echo "$catalog: complete source $source_id still has unresolved audit rows:" >&2
          echo "$unresolved" >&2
          status_code=1
        fi

        if [ -f "$review_file" ]; then
          unresolved_text=$(awk '
            /^## 未解决[[:space:]]*$/ { found=1; next }
            found && NF { print; exit }
          ' "$review_file")
          case "$unresolved_text" in
            无|无。) ;;
            *)
              echo "$review_file: complete source must have an 未解决 section whose first content line is 无。" >&2
              status_code=1
              ;;
          esac
        fi
      fi
      ;;
    *)
      echo "$catalog: $source_id has invalid status: $source_status" >&2
      status_code=1
      ;;
  esac
done < "$catalog"

exit "$status_code"
