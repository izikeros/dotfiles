#!/bin/bash

source ./helper_functions.sh
PTH=".config/polybar"

symlink_dotfile "$HOME/dotfiles/$PTH/config" "$HOME/$PTH/config"
symlink_dotfile "$HOME/dotfiles/$PTH/master.conf" "$HOME/$PTH/master.conf"
symlink_dotfile "$HOME/dotfiles/$PTH/modules.conf" "$HOME/$PTH/modules.conf"
symlink_dotfile "/home/bulk/polybar-scripts/polybar-scripts" "$HOME/polybar-scripts"