#!/usr/bin/env sh
upower -d | grep "energy-rate" | head -n1 | awk '{print $2 $3}'
