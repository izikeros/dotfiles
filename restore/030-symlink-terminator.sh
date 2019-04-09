#!/bin/bash

source ./helper_functions.sh
PTH=".config/terminator"

symlink_dotfile "$HOME/dotfiles/$PTH" "$HOME/$PTH"