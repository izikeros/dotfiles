#!/bin/bash
for i in *.mkv; do
    ffmpeg -i "$i" -codec copy -movflags +faststart "${i%.*}.mp4"
done

