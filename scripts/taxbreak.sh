#!/usr/bin/env bash
# taxbreak.sh
# Provide one month list of changes. Your current dir must be in the git repo.
# Example:
# taxbreak.sh
#
# author: Krystian Safjan (ksafjan@gmail.com)
# Licence MIT

set -Eeuo pipefail

DATE=$(date  +%Y-%m)
# TOMORROW=$(date -d "$1days 13:00" +%Y-%m-%d)
TOMORROW=$(date -d "+1 day" "+%Y-%m-%d")
echo "$TOMORROW"
AUTHOR_NAME="Krystian Safjan"

#SINCE='1 month'

FILES_ADDED=$HOME/Documents/taxbreak/${DATE}_taxbreak_git_added_files.txt
FILES_ADDED_DOCS=$HOME/Documents/taxbreak/${DATE}_taxbreak_added_docs.txt
FILES_MODIFIED_DOCS=$HOME/Documents/taxbreak/${DATE}_taxbreak_modified_docs.txt
FILES_MODIFIED_CODE=$HOME/Documents/taxbreak/${DATE}_taxbreak_modified_proj.txt

# TODO: improve rule: .py to capture both \.py and \.ipynb
git whatchanged --since "${DATE-01}" --until "${TOMORROW}" --oneline --name-status --pretty=format: | sort | uniq | grep ^A > "$FILES_ADDED"
find ~/Documents/brain -type f -ctime -30 -exec stat -c "%w %n" {} \; | grep "$(date  +%Y-%m)" | cut -d' ' -f1,4- >> "$FILES_ADDED_DOCS"
find ~/Documents/brain -type f -mtime -30 -exec stat -c "%w %n" {} \; | grep "$(date  +%Y-%m)" | cut -d' ' -f1,4- >> "$FILES_MODIFIED_DOCS"
find ~/projects/nokia -type f -mtime -30 -exec stat -c "%w %n" {} \; | grep -v '.git' | grep "$(date  +%Y-%m)" | cut -d' ' -f1,4- >> "$FILES_MODIFIED_CODE"
echo "Files added to git repo and brain folder saved to: $FILES_ADDED"

FILE_COMMITS=$HOME/Documents/taxbreak/${DATE}_taxbreak_commits.txt
git log --pretty=format:"%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short --since="$DATE-01" | grep "$AUTHOR_NAME" | grep "$DATE" > "$FILE_COMMITS"
echo "Commits to git repo saved to: $FILE_COMMITS"

xdg-open ~/Documents/taxbreak &
