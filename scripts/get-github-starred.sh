#!/usr/bin/env bash

~/dotfiles/scripts/getstarred.sh | \
# replace quoted csv with commaas separator with unquoted with ^ as separator
sed 's/^\"//g' | sed 's/\",\"/\^/g' | sed 's/\"$//g' | \
# remove duplicates
sort -u | \
# sort by date (recently starred first)
sort -k4 --reverse > ~/data/github-izikeros-stars-desc-ng.txt
