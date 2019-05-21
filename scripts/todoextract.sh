#!/bin/bash

find $1 -name "*.py" | xargs grep -n "TODO:\|FIXME:"
find $1 -name "*.py" | xargs grep -n "TODO:\|FIXME:" | wc -l

