#!/usr/bin/env bash

# shellcheck source=./helper_functions.sh
source "$HOME/dotfiles/restore/helper_functions.sh"

# symlink snippets
symlink_dotfile ~/dotfiles/snippets ~/.vim/snippets
