#!/bin/bash

sudo pacman -S git stow
cd ~/Public
git clone https://github.com/izikeros/dotfiles.git
mkdir -p ~/Downloads/stowbackup
mv ~/.bashrc ~/Downloads/stowbackup
# symlink all files in dotfiles dir to home dir
cd ~/Public/dotfiles

# link only folders (trailing slash)
stow -v -t ~ */
    # delete (-D flag)
    stow -v -D -t ~ */
    stow -v -D -t ~ tmux
    # redo link (-R)
    stow -v -R -t ~ */
    stow -v -R -t ~ tmux
sudo pacman -S zsh zsh-completions
chsh -s /usr/bin/zsh
cd ~/Public/dotfiles/zshrc
#git clone https://github.com/robbyrussell/oh-my-zsh.git
