#!/bin/bash
# nela-convert.sh - convert Nela clips downloaded to nela_out to mp4 format

for filename in *.ismv; do
    ffmpeg -i "$filename" -strict experimental -acodec aac -vcodec libx264 -f mp4 ../nela_out/"$filename".mp4
done
