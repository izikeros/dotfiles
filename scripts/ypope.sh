#!/usr/bin/env bash
yay -Ss $1 | grep $1 | grep -e + | sed -e 's/(+//' | awk -F' ' '{print $3"\t"$1}' | sed 's/aur\///' | sort -nr | head -10
