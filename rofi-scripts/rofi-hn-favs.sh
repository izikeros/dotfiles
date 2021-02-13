#!/bin/zsh
FNAME=$(find ~/data/ -name 'HackerNews_fav*' | head -n1)
cat "$FNAME" | rofi -i -dmenu | awk -F"\"," '{print $2}' | tr '"' '' | xargs brave