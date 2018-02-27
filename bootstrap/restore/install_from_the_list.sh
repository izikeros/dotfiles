#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt [--ask]
# if there is --ask (or anything else) after filename then youwill be prompted to confirm installation of each package

# 0. preprocess packages list
# 1. install generic packages
# 2. install system specific packages
# 3. if Arch install yaourt packages
# 4. if ubuntu install from ppa

# Get system and install command
#source $HOME/dotfiles/bootstrap/restore/get_distro_pkg_install_command.sh

# ---- Preprocess packages list: ----
# TODO: ignore comments
#	1. lines starting with #
#   2. everything after #

# TODO: support different package names for different systems
# e.g. grep list and create separate files with packages specific for ubuntu
# and arch, split arch to pacman and yaourt lists:

ASK=$2
echo "Ask is: $ASK"
TMP_FILE=/tmp/install_list.txt
CMD=`$HOME/dotfiles/bootstrap/restore/get_distro_pkg_install_command.sh`

if [ -z "${CMD}" ]; then
    echo "Cannot determine distro and package manager. Aborting."
    exit 1
else
	echo "Using command: $CMD"
fi

# remove comments
cat $1 | sed -e "s/#.*$//gi" -e "/^$/d" > $TMP_FILE

N=`cat $TMP_FILE | wc -l`

echo "Found $N packages on the list:"
while read package;
do
	echo -ne "$package "
done < $TMP_FILE
echo

do_install=y                      # In batch mode => Default is Yes
[[ -t 0 ]] &&                  	  # If TTY => Prompt the question
read -n 1 -p $'\e[1;32m
Continue with installation? (Y/n)\e[0m ' do_install  # Store the answer in $do_xxxx
if [[ $do_install =~ ^(y|Y|)$ ]]  # Do if 'y' or 'Y' or empty
then
	NOT_INSTALLED=()
	if [ -z "${ASK}"]; then
		# install without asking
		while read package;
		do
			echo "--- $package ---"
			$CMD $package
			if [ $? == 0 ]; then
				echo ""
			else
				# 
				NOT_INSTALLED+=($package)
			fi
			echo ""
		done < $TMP_FILE
		rm $TMP_FILE
	else
		# FIXME: asking not working
		# install with asking
		while read package;
		do
			read -p "Continue (y/n)?" choice
			case "$choice" in 
			  y|Y ) echo "--- $package ---"
					$CMD $package
					echo "";;
			  n|N ) echo "";;
			  * ) echo "invalid";;
			esac
		done < $TMP_FILE
		rm $TMP_FILE
	fi
fi

echo "=================================="
echo "These packages were not installed:"
echo "=================================="
printf '%s\n' "${NOT_INSTALLED[@]}"