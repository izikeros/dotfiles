#!/bin/bash
# run this as su

PKG_PATH=$HOME/dotfiles/bootstrap/pkg
CMD=`get_distro_pkg_install_command.sh`

# install minimal set of packages from curated list
echo "Initiating install of basics"

xargs sudo $CMD < $PKG_PATH/pkg-lst-basic.txt
