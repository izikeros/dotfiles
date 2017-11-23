#!/bin/bash

log_msg "Updating repo list"
apt-get update

#TODO: add ppa

# install minimal set of packages from curated list
log_msg "Initiating install of basics"
apt-get install -y git mc ranger rofi htop curl wget ran rscync zsh openssh-client openssh-server python-pip