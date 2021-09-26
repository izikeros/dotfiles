#!/usr/bin/env bash
# convert-mkv-to-mp4.sh - convert all mkv files in current dir to mp4 format

for i in *.mkv; do
    ffmpeg -i "$i" -codec copy -movflags +faststart "${i%.*}.mp4"
done

