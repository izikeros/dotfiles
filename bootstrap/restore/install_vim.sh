#!/bin/bash

# ======= prepare vim
source $HOME/dotfiles/bootstrap/restore/helper_functions.sh

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
vim -c ":VundleInstall"

# TODO: symlink snippets
