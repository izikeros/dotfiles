#!/bin/bash

BACKUP_DIR="$HOME/backup"

exec >> err_file

CMD=`./get_distro_pkg_install_command.sh`

source ./helper_functions.sh

symlink_dotfile ./dotfiles/.bashrc ~/.bashrc
symlink_dotfile ./dotfiles/.zshrc_omzsh ~/.zshrc
symlink_dotfile ./dotfiles/.aliases.sh ~/.aliases.sh
symlink_dotfile ./dotfiles/env_vars.sh ~/env_vars.sh
symlink_dotfile ./dotfiles/functions.sh ~/functions.sh
symlink_dotfile ./dotfiles/.vimrc ~/.vimrc
symlink_dotfile ./dotfiles/.xbindkeysrc ~/.xbindkeysrc
symlink_dotfile ./dotfiles/.Xresources ~/.Xresources
symlink_dotfile ./dotfiles/.gitconfig ~/.gitconfig
# doublecommander
# rofi theme

# ======= prepare vim
# install vim vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	mkdir -p ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install wombat colors
if [ ! -L ~/.vim/colors/wombat256mod.vim ]; then
	mkdir -p ~/.vim/colors/
	symlink_dotfile ~/dotfiles/wombat256mod.vim ~/.vim/colors/wombat256mod.vim
fi

# ======== install omzsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "omzsh should be installed, you might want to switch shell to zsh via command: 'chsh -s /bin/zsh'"

# ======== install ZSH spaceship theme
# TODO: $ZSH_CUSTOM seems to be not set, need to install manually for now
#git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
#ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# ======== install z
if [ ! -d ~/z ]; then
    git clone https://github.com/rupa/z ~/z
fi
echo "z installed"

# ======== install fzf
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
echo "fzf installed"

# TODO:
# install ppa repositories
# install tools from pip packages
# restore docker images
# restore npm packages
# python virtual environments - packages from freeze
# /etc/hosts
# /etc/fstab
# veracrypt volumes
