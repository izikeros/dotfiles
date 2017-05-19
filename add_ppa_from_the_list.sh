#!/bin/bash
while read repo;
do
	echo "--- adding repo $repo ---"
	sudo add-apt-repository ppa:$repo
	echo ""
done < $1
