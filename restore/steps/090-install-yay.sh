#!/bin/bash

set -e
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay || exit
makepkg -si

echo "### yay installed"