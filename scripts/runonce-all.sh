#!/bin/zsh
#fortune art tao wisdom work
for f in $HOME/dotfiles/scripts/runonce-scripts/*.sh; do
    zsh "$f" -H
done

