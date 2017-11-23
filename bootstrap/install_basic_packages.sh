#!/bin/bash

apt-get update

# install minimal set of packages from curated list
apt-get install -y vim git mc ranger rofi htop curl wget rsync zsh openssh-client openssh-server python-pip
