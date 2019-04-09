#!/bin/bash

# ======= prepare vim
# shellcheck source=./helper_functions.sh
source "$HOME/dotfiles/restore/helper_functions.sh"

symlink_dotfile ./dotfiles/.vimrc ~/.vimrc

# install wombat colors
if [ ! -L ~/.vim/colors/wombat256mod.vim ]; then
    mkdir -p ~/.vim/colors/
    symlink_dotfile ~/dotfiles/wombat256mod.vim ~/.vim/colors/wombat256mod.vim
fi

# install vim vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	mkdir -p ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install vundle plugins
vim -S <(echo -e "VundleInstall \n q \n q")

# symlink snippets
symlink_dotfile ~/dotfiles/snippets ~/.vim/snippets

# TODO: symlink snippets
