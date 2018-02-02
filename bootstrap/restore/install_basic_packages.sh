#!/bin/bash
# run this as su

# TODO: read list from file

CMD=`get_distro_pkg_install_command.sh`

# install minimal set of packages from curated list
echo "Initiating install of basics"
xargs sudo $CMD < pkg-lst-basic.txt
