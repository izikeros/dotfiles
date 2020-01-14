#!/bin/bash
# diary-month-summary.sh - create file with month summary from the diary entries
# Usage:
# diary-month-summary.sh 2019-11

find "$HOME/vimwiki/diary" -type f -name '*.md' | \
    grep $1 |\
    xargs head -q -n1 |\
    sed 's/^#\s//' |\
    sort > "$HOME/vimwiki/diary/m-$1.txt"

