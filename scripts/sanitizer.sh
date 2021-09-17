#!/bin/bash

FILE_TYPE=${1:-*}
echo "F:$FILE_TYPE"
find . -iname "$FILE_TYPE" | while read f
do
	echo $f
	# allowed: letters, numbers and dot, coma and slash. The rest would be replaced by underscore
	nf=$(echo $f | sed -e 's/[^A-Za-z0-9/._-]/_/g')
	mv "$f" "$nf"
done
