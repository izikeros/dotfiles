#!/bin/bash
cat ~/.config/keyboards_list | rofi -dmenu -p "Choose keyboard:" -a 0 -no-custom | xargs setxkbmap -model microsoft4000 -layout
