#!/usr/bin/env bash
# Yay POPular Exact package
# find pattern in package name, sort result by popularity

yay -Ss "$1" | grep "$1" | grep -e + | sed -e 's/(+//' | awk -F' ' '{print $3"\t"$1}' | sed 's/aur\///' | sort -nr | head -10
