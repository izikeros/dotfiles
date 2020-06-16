#!/bin/bash
# ismv-convert.sh - convert ismv videos to mp4 format

# the native ffmpeg AAC audio encoder was experimental and you needed
# to add -strict -2 or -strict experimental to your command use it.
# However, this encoder is no longer marked as experimental,
# so recent ffmpeg builds do not need to use this option


for i in *.ismv; do ffmpeg -i "$i" -acodec aac -vcodec libx264 -f mp4 "$(basename "${i/.ismv}").mp4"; done;
