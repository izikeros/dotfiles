#!/bin/bash
pactl list sinks short | awk '{print $2}' | rofi -dmenu -i -p "Audio output:" -no-custom -width 40 -lines 5| xargs -I{} pactl set-default-sink {}