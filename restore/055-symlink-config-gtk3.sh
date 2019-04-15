#!/bin/bash

set -e

# shellcheck source=./helper_functions.sh
source "$HOME/dotfiles/restore/helper_functions.sh"

symlink_dotfile ~/dotfiles/dotfiles/.config/gtk-3.0 ~/.config/gtk-3.0

echo "### gtk-3.0 symlinked"