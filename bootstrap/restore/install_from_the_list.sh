#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt

# 0. preprocess packages list
# 1. install generic packages
# 2. install system specific packages
# 3. if Arch install yaourt packages
# 4. if ubuntu install from ppa

# Get system and install command
source $HOME/dotfiles/bootstrap/restore/get_distro_pkg_install_command.sh

# ---- Preprocess packages list: ----
# TODO: ignore comments
#	1. lines starting with #
#   2. everything after #

# TODO: support different package names for different systems
# e.g. grep list and create separate files with packages specific for ubuntu
# and arch, split arch to pacman and yaourt lists:


CMD=`$HOME/dotfiles/bootstrap/restore/get_distro_pkg_install_command.sh`
while read package;
do
	echo "--- $package ---"
	$CMD install $package
	echo ""
done < $1


