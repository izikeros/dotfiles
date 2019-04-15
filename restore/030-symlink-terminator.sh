#!/bin/bash

set -e

# shellcheck source=./helper_functions.sh
source ./helper_functions.sh
PTH="dotfiles/.config/terminator"

symlink_dotfile "$HOME/dotfiles/$PTH" "$HOME/$PTH"

echo "### Terminator config symlinked"