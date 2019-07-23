#!/bin/bash

set -e
# shellcheck source=./helper_functions.sh
source "$HOME/dotfiles/restore/helper_functions.sh"

symlink_dotfile ./dotfiles/dotfiles/.vimrc ~/.vimrc

# install wombat colors from settings
if [ ! -L ~/.vim/colors/wombat256mod.vim ]; then
    mkdir -p ~/.vim/colors/
    symlink_dotfile ~/dotfiles/settings/vim/wombat256mod.vim ~/.vim/colors/wombat256mod.vim
fi

# install vim vundle from github
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	mkdir -p ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install vundle plugins
vim -S <(echo -e "VundleInstall \n q \n q")

echo "### vim installed and configured"
