#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt

# TODO: ignore comments
#	1. lines starting with #
#   2. everything after #

# TODO: support for multiple systems

# handle yaourt markings

CMD=`get_distro_pkg_install_command`
while read package;
do
	echo "--- $package ---"
	$CMD install $package
	echo ""
done < $1
