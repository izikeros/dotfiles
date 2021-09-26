#!/usr/bin/env bash

FILES="boots.log
coingecko_data.json
github-izikeros-stars-desc-ng.txt
hn_favs.csv
"

for f in $FILES
do
	MODDATE=$(stat -c %y ~/data/"$f")
	MODDATE=${MODDATE%% *}
	echo "$MODDATE - $f"
done
