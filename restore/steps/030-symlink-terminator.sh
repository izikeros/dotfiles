#!/bin/bash

set -e

# shellcheck source=./helper_functions.sh
source ./helper_functions.sh
PTH=".config/terminator"

symlink_dotfile "$HOME/dotfiles/dotfiles/$PTH" "$HOME/$PTH"

echo "### Terminator config symlinked"
