#!/bin/zsh
# fortune art tao wisdom work
# update jira
# update hn-favs
# update bookmarks
if [[ $HOST == 'archlabs' ]]; then
	for f in $HOME/dotfiles/runonce-scripts/*.sh; do
	    zsh "$f" -H
	done
fi

