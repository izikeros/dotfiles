#!/usr/bin/env bash
# author: Krystian Safjan (ksafjan@gmail.com)
# Licence MIT

# fetch my hackernews favourites and save to csv
HN_FAV_FNAME=$HOME/data/hn_favs.csv
# get all favs
# TODO: replace with similar bash downloader as for github stars (see: getstarred.sh)

$HOME/projects/priv/hacker-news-favourites-downloader/hafado.py -u izik > "$HN_FAV_FNAME"
echo "Done"

