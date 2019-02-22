#!/bin/bash

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --country 'Poland' -l 5 --sort rate --save /etc/pacman.d/mirrorlist