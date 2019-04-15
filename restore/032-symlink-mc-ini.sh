#!/bin/bash

set -e

# shellcheck source=./helper_functions.sh
source ./helper_functions.sh
DCMDR_PATH="dotfiles/.config/mc"

echo "Creating dir: $HOME/$DCMDR_PATH"
mkdir -p "$HOME/$DCMDR_PATH"

symlink_dotfile "$HOME/dotfiles/$DCMDR_PATH/ini" "$HOME/$DCMDR_PATH/ini"

echo "### mc config symlinked"