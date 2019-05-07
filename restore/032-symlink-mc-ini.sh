#!/bin/bash

set -e

# shellcheck source=./helper_functions.sh
source ./helper_functions.sh
MC_PATH=".config/mc"

echo "Creating dir: $HOME/$MC_PATH"
mkdir -p "$HOME/$MC_PATH"

symlink_dotfile "$HOME/dotfiles/dotfiles/$MC_PATH/ini" "$HOME/$MC_PATH/ini"

echo "### mc config symlinked"
