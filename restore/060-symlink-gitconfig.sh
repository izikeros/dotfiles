#!/bin/bash

set -e
source ./helper_functions.sh
symlink_dotfile ~/dotfiles/dotfiles/.gitconfig ~/.gitconfig

echo "### .gitconfig symlinked"
