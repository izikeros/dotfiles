#!/bin/bash

set -e

# shellcheck source=./helper_functions.sh
source ./helper_functions.sh

symlink_dotfile "$HOME/dotfiles/dotfiles/.gitignore_global" "$HOME/.gitignore"
git config --global core.excludesfile "$HOME/.gitignore"

echo "### global .gitignore added"