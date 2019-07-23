#!/bin/bash

set -e
source ./helper_functions.sh
DCMDR_PATH=".config/doublecmd"

echo "Creating dir: $HOME/$DCMDR_PATH"
mkdir -p "$HOME/$DCMDR_PATH"

symlink_dotfile "$HOME/dotfiles/dotfiles/$DCMDR_PATH/doublecmd.xml" "$HOME/$DCMDR_PATH/doublecmd.xml"

echo "### doublecmd config symlinked"
