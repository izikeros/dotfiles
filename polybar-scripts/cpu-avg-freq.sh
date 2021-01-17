#!/bin/bash
freq=$(cat /proc/cpuinfo | grep MHz | awk -F": " '{print $2}' | awk '{ sum += $1 } END { if (NR > 0) printf "%d\n", sum / NR }')
echo "$freq MHz"