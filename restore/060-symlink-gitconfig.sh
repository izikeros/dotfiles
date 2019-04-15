#!/bin/bash

set -e
source ./helper_functions.sh
symlink_dotfile ./dotfiles/.gitconfig ~/.gitconfig

echo "### .gitconfig symlinked"