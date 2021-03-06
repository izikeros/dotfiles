#!/bin/bash
# Return proper command for package installation on Ubuntu or Arch linux

# Arch linux ultimate installer
# https://github.com/helmuthdu/aui/blob/master/sharedfuncs
SYS=""
grep -q  "Ubuntu" /etc/issue && SYS="ubuntu"
grep -q  "Arch\|archlabs" /etc/issue && SYS="arch"

if [ "$SYS" == "ubuntu" ]; then
    #echo "-- Ubuntu Linux detected, using apt-get"
    #echo "-- Updating repo list"
    sudo apt-get update -qq
    CMD="apt-get install -y"
fi

if [ "$SYS" == "arch" ]; then
    #echo "Arch Linux detected, using pacman"
    CMD="sudo pacman -Sy --noconfirm"
fi

if [ "$SYS" == "" ]; then
    #echo "No known system (Ubuntu|Arch) detected"
    exit 1
fi

echo "$CMD"
