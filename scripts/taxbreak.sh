#!/bin/bash
# Provide one month list of changes. Your current dir must be in the git repo.
# Example:
# taxbreak.sh
#

DATE=$(date  +%Y-%m)
TODAY=$(date -d "$1days 13:00" +%Y-%m-%d)
echo $TODAY
AUTHOR_NAME="Krystian Safjan"

#SINCE='1 month'

FILES_ADDED=$HOME/Documents/taxbreak/${DATE}_taxbreak_added.txt
# TODO: improve rule: .py to capture both \.py and \.ipynb
#git diff --name-status "@{$DATE-01}" "@{$TODAY}" | grep "^A" | grep ".py" > $FILES_ADDED
git whatchanged --since ${DATE-01} --until ${TODAY} --oneline --name-status --pretty=format: | sort | uniq | grep ^A > $FILES_ADDED
echo "Files added to git repo saved to: $FILES_ADDED"

FILE_COMMITS=$HOME/Documents/taxbreak/${DATE}_taxbreak_commits.txt
git log --pretty=format:"%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short --since="$DATE-01" | grep "$AUTHOR_NAME" | grep "$DATE" > "$FILE_COMMITS"
echo "Commits to git repo saved to: $FILE_COMMITS"

