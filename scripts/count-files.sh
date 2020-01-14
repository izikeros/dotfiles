#!/usr/bin/env sh
# count-files.sh - count files in each dir in current directory
#

find . -maxdepth 1 -type d -print0 | while IFS= read -r -d '' i ; do
    echo -n $i": " ;
    (find $i -type f | wc -l) ;
done
