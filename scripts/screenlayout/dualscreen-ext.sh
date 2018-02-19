#!/bin/sh
xrandr \
    --output LVDS-1-1 --mode 1600x900 --pos 0x176 --rotate normal --primary\
    --output DP-1     --mode 1920x1200 --pos 1600x0 --rotate normal
