#!/bin/bash
# Provide one month list of changes. Your current dir must be in the git repo.
# Example:
# taxbreak.sh 2020-01
#

DATE=$(date  +%Y-%m)
AUTHOR_NAME="Krystian Safjan"
SINCE='1 month'
OUT_FILE=$HOME/Documents/taxbreak/${DATE}_taxbreak.txt
git log --pretty=format:"%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short --since="$SINCE" | grep "$AUTHOR_NAME" | grep "$DATE" > "$OUT_FILE"
echo "Git log saved to: $OUT_FILE"
