#!/usr/bin/env bash
# fetch and append last page of favourites to fav file on the disk,
# then sort and get unique lines to remove duplicates.
HN_FAV_FNAME=$HOME/data/hn_favs.csv
$HOME/projects/priv/hacker-news-favourites-downloader/hafado.py -u izik -l 1 >> $HN_FAV_FNAME &&\
    echo "Appended" &&\
    sort -u $HN_FAV_FNAME > /tmp/favs.csv &&\
    echo "Sorted, uniqued and save to temp file" &&\
    rm $HN_FAV_FNAME &&\
    echo "Removed original favs file in data" &&\
    mv /tmp/favs.csv $HN_FAV_FNAME &&\
    echo "Moved temp file to data folder"
echo "Completed"

