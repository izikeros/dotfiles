#!/bin/bash

source ./helper_functions.sh
DCMDR_PATH=".config/mc"

echo "Creating dir: $HOME/$DCMDR_PATH"
mkdir -p "$HOME/$DCMDR_PATH"

symlink_dotfile "$HOME/dotfiles/$DCMDR_PATH/ini" "$HOME/$DCMDR_PATH/ini"