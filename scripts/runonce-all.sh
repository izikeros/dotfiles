#!/bin/zsh

for f in $HOME/dotfiles/scripts/runonce-scripts/*.sh; do
    zsh "$f" -H
done

