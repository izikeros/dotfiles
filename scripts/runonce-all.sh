#!/bin/zsh
fortune
for f in $HOME/dotfiles/scripts/runonce-scripts/*.sh; do
    zsh "$f" -H
done

