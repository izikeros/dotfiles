#!/usr/bin/env sh
upower -d | grep "energy-rate" | head -n1 | awk '{print "Power: "$2 $3" "}'
