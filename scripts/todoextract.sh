#!/bin/bash
# Extract TODO and FIXME from python files. Count number of occurences.
#TODO: make date first column, sort by date
find $1 -name "*.py" | xargs grep -n "TODO:\|FIXME:"
find $1 -name "*.py" | xargs grep -n "TODO:\|FIXME:" | wc -l

