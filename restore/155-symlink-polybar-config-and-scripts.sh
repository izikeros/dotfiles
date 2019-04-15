#!/bin/bash

source ./helper_functions.sh
PTH=".config/polybar"

symlink_dotfile "$HOME/dotfiles/dotfiles/$PTH/config" "$HOME/$PTH/config"
symlink_dotfile "$HOME/dotfiles/dotfiles/$PTH/master.conf" "$HOME/$PTH/master.conf"
symlink_dotfile "$HOME/dotfiles/dotfiles/$PTH/modules.conf" "$HOME/$PTH/modules.conf"

# ensure that there is dir for trash (polybar script is looking for it)
mkdir -p ~/.local/share/Trash/files

echo "### polybar configuration symlinked"

