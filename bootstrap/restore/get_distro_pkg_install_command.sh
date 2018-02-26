#!/bin/bash
# Return proper command for package installation on Ubuntu or Arch linux

SYS=""
uname -a | grep -q  "Ubuntu" && SYS="ubuntu"
uname -a | grep -q  "Arch\|archlabs" && SYS="arch"

if [ "$SYS" == "ubuntu" ]; then
    #echo "-- Ubuntu Linux detected, using apt-get"
    #echo "-- Updating repo list"
    sudo apt-get update -qq
    CMD="apt-get install -y"
fi

if [ "$SYS" == "arch" ]; then
    #echo "Arch Linux detected, using pacman"
    CMD="pacman -Sy"
fi

if [ "$SYS" == "" ]; then
    #echo "No known system (Ubuntu|Arch) detected"
    exit 1
fi

echo $CMD
