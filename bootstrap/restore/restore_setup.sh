#!/bin/bash

#BACKUP_DIR="$HOME/backup"
# exec >> err_file # redirect stdout to logfile
# CMD=`./get_distro_pkg_install_command.sh`

source ./helper_functions.sh

echo "-------- symlinking configuration files -----------"
symlink_dotfile ./dotfiles/.bashrc ~/.bashrc
symlink_dotfile ./dotfiles/env_vars.sh ~/env_vars.sh

symlink_dotfile ./dotfiles/.xbindkeysrc ~/.xbindkeysrc
symlink_dotfile ./dotfiles/.Xresources ~/.Xresources

symlink_dotfile ./dotfiles/.gitconfig ~/.gitconfig

# double commander
DCMDR_PATH=".config/doublecmd"
mkdir -p $HOME/$DCMDR_PATH
#symlink_dotfile ./dotfiles/$DCMDR_PATH/doublecmd.xml $HOME/$DCMDR_PATH/doublecmd.xml

# rofi theme (set manually, use rofi-theme-selector):
# -- lb

XFCE_DIR=".config/xfce4/xfce-perchannel-xml"
mkdir -p $HOME/$XFCE_DIR
#symlink_dotfile ./dotfiles/$XFCE_DIR/xfce4-keyboard-shortcuts.xml $HOME/$XFCE_DIR/xfce4-keyboard-shortcuts.xml



# ======== install omzsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "omzsh should be installed, you might want to switch shell to zsh via command: 'chsh -s /bin/zsh'"
symlink_dotfile ./dotfiles/.zshrc_omzsh ~/.zshrc

# ======== install z
if [ ! -d ~/z ]; then
    git clone https://github.com/rupa/z ~/z
    echo "z cloned to ~/z"
else
    echo "z directory already exist, skipping cloning"
fi
echo

# ======== install fzf
# NOTE: On arch can be installed from packages
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo "fzf installed"
else
    echo "~/.fzf directory already exist, skipping cloning and installation"
fi
echo



# ======== install ZSH spaceship theme
# TODO: $ZSH_CUSTOM seems to be not set, need to install manually for now
#git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
#ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# TODO:
# install ppa repositories
# install tools from pip packages
# restore docker images
# restore npm packages
# python virtual environments - packages from freeze
# /etc/hosts
# /etc/fstab
# veracrypt volumes
