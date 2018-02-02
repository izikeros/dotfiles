#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt
while read package;
do
	echo "--- $package ---"
	apt-get -y install $package
	echo ""
done < $1
