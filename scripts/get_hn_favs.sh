#!/usr/bin/env bash
# author: Krystian Safjan (ksafjan@gmail.com)
# Licence MIT

set -e

# fetch my hackernews favourites and save to csv
HN_FAV_FNAME=$HOME/data/hn_favs.csv
if [ -f "$HN_FAV_FNAME" ]; then
    # get only latests favs if file already exists
    "$HOME"/dotfiles/scripts/append_hn_favs.sh &
else
    # get all favs
    "$HOME"/projects/priv/hacker-news-favourites-downloader/hafado.py -u izik > "$HN_FAV_FILE" &
fi
echo "Done"

