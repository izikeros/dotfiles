#!/bin/bash

set -e
source ./helper_functions.sh
symlink_dotfile ~/dotfiles/dotfiles/.dircolors ~/.dircolors

echo "### .dircolors symlinked"
