#!/bin/zsh
#fortune art tao wisdom work
if [[ $HOST == 'archlabs' ]]; then
	for f in $HOME/dotfiles/scripts/runonce-scripts/*.sh; do
	    zsh "$f" -H
	done
fi

