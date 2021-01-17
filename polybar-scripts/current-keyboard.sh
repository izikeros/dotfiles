#!/bin/bash
keyboard=$(setxkbmap -print -verbose 7 | grep layout | awk -F":" '{print $2}' | xargs )
echo "$keyboard"