#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt

# TODO: ignore comments
#	1. lines starting with #
#   2. everything after #

# TODO: support for multiple systems

# handle yaourt markings

CMD=`$HOME/dotfiles/bootstrap/restore/get_distro_pkg_install_command.sh`
while read package;
do
	echo "--- $package ---"
	$CMD install $package
	echo ""
done < $1
