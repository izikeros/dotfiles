#!/usr/bin/env bash
touch requirements_all.txt
for filename in requirements/*.txt; do
    cat $filename >> requirements_all.txt
done

