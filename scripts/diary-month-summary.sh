#!/bin/bash

find ./ -type f -name '*.md' | \
    grep $1 |\
    xargs head -q -n1 |\
    sed 's/^#\s//' > "m-$1.txt"

