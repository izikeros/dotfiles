#!/usr/bin/env bash
# Basic wallpaper changer
# author: Krystian Safjan (ksafjan@gmail.com)
# Licence MIT

set -e
DIR="/home/izik/Pictures/wallpapers/motivation"
# killall wall.sh
while true; do
pcmanfm --set-wallpaper="$(find $DIR -type f | shuf -n1)"
sleep 30m
done
