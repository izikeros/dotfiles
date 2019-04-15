#!/bin/bash

set -e
# shellcheck source=./helper_functions.sh
source ./helper_functions.sh

symlink_dotfile ./dotfiles/dotfiles/.zshrc_zgen_with_setup_script ~/.zshrc
symlink_dotfile ./dotfiles/dotfiles/.zsh_aliases ~/.zsh_aliases
symlink_dotfile ./dotfiles/dotfiles/.zsh_functions ~/.zsh_functions
symlink_dotfile ./dotfiles/dotfiles/.zgen-setup ~/.zgen-setup

echo "### Zsh-related files symlinked"