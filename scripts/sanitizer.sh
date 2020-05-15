#!/bin/bash
find . -iname "*mp3" | while read f
do
	nf=$(echo $f | sed -e 's/[^A-Za-z0-9/._-]/_/g')
	mv "$f" "$nf"
done
