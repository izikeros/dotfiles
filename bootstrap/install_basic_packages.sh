#!/bin/bash
# run this as su

echo "Updating repo list"
apt-get update

#TODO: add ppa

# install minimal set of packages from curated list
echo "Initiating install of basics"
apt-get install -y git mc htop curl wget rsync zsh openssh-client openssh-server python-pip terminator
apt-get install -y ranger rofi tree
