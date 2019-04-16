#!/bin/zsh

for f in $HOME/dotfiles/scripts/runonce-scripts/*.sh; do
  bash "$f" -H
done

