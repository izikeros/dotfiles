#!/bin/sh

printf "VPN: " && (pgrep -a vpnc$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 && echo down) | head -n 1
