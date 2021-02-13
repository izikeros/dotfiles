#!/usr/bin/env bash
FILE=$HOME/data/boots.log
if [[ -e $FILE ]]; then
    journalctl --list-boots | sed 's/^\s\+//' | cut -d ' ' -f2- >> $FILE
    echo "Append to $FILE"
else
    journalctl --list-boots | sed 's/^\s\+//' | cut -d ' ' -f2- > $FILE
    echo "Create $FILE"
fi

# sort -k2 -u -o $FILE $FILE

