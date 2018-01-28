#!/bin/bash

BACKUP_DIR="$HOME/backup"

exec >> err_file

$CMD=`./get_distro_pkg_install_command.sh`

source ./helper_functions.sh


# add ppa repositories
# TODO:

# /etc/hosts
# /etc/fstab
# veracrypt volumes


# log_msg "Getting configuration/dotfiles"
# apt-get install -y git
# git clone https://github.com/izikeros/dotfiles.git

symlink_dotfile ./dotfiles/.bashrc ~/.bashrc
symlink_dotfile ./dotfiles/.zshrc_omzsh ~/.zshrc
symlink_dotfile ./dotfiles/.aliases.sh ~/.aliases.sh
symlink_dotfile ./dotfiles/env_vars.sh ~/env_vars.sh
symlink_dotfile ./dotfiles/functions.sh ~/functions.sh
symlink_dotfile ./dotfiles/.vimrc ~/.vimrc
symlink_dotfile ./dotfiles/.xbindkeysrc ~/.xbindkeysrc
symlink_dotfile ./dotfiles/.Xresources ~/.Xresources
symlink_dotfile ./dotfiles/.gitconfig ~/.gitconfig

# ======= install Dropbox
if hash dropbox 2>/dev/null; then
	echo "Seems that Dropbox is already installed"
else
	echo "Installing Dropbox"
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -    date "$@"
fi
# TODO: if not running dropbox then run it
# run Dropbox
#~/.dropbox-dist/dropboxd &

# ======= prepare vim
# install vim vundle
if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
	mkdir -p ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install wombat colors
if [ ! -f ~/.vim/colors/wombat256mod.vim ]; then
	mkdir -p ~/.vim/colors/
	symlink_dotfile ./dotfiles/wombat256mod.vim ~/.vim/colors/wombat256mod.vim
fi
# TODO

# install ppa repositories


# ======== install omzsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "omzsh should be installed, you might want to switch shell to zsh via command: 'chsh -s /bin/zsh'"

# ======== install z
if [ ! -d ~/.z ]; then
    git clone https://github.com/rupa/z
fi
echo "z installed"

# install tools from pip packages
# restore docker images
# restore npm packages
# python virtual environments
# - packages from freeze
