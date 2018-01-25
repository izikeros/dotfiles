#!/bin/bash
# run this as su

# TODO: read list from file

# TODO: recognize system (Arch/Ubuntu)
SYS=""
uname -a | grep -q  "Ubuntu" && SYS="ubuntu"
uname -a | grep -q  "Arch" && SYS="arch"
if [ "$SYS" == "ubuntu" ]; then
    #TODO: add ppa repositories(?, perhaps not in this script)
    echo "-- Ubuntu Linux detected, using apt-get"
    echo "-- Updating repo list"
    apt-get update
    CMD="apt-get install -y"
fi

if [ "$SYS" == "arch" ]; then
    CMD="apt-get install -y"
    echo "Arch Linux detected, using pacman"
    CMD="pacman -Sy"
fi


# install minimal set of packages from curated list
echo "Initiating install of basics"
$CMD git mc htop curl wget rsync zsh openssh-client openssh-server python-pip terminator
