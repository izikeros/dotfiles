#!/bin/bash
# diary-year-summary.sh - create file with year summary from the diary entries
# Usage:
# diary-year-summary.sh 2019

find "$HOME/vimwiki/diary" -type f -name '*.md' | \
    grep $1 |\
    xargs head -q -n1 |\
    sed 's/^#\s//' |\
    sort > "./y-$1.txt"

