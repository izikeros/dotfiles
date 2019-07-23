#!/bin/bash

set -e
source ./helper_functions.sh
symlink_dotfile ~/dotfiles/dotfiles/.tmux.conf ~/.tmux.conf

echo "### .tmux.conf symlinked"
