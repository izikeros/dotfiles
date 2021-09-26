#!/usr/bin/env bash
# rofi-set-proxy.sh
# Use rofi gui to set the proxy

sel=$(cat ~/proxy_list.txt | rofi -dmenu -p "Choose file to edit:")
export http_proxy=$sel
export https_proxy=$sel
export ftp_proxy=$sel

echo "changing proxy to: $http_proxy"