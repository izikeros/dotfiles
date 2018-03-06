#!/bin/bash

#BACKUP_DIR="$HOME/backup"
# exec >> err_file # redirect stdout to logfile
# CMD=`./get_distro_pkg_install_command.sh`

source ./helper_functions.sh

echo "-------- symlinking configuration files -----------"
symlink_dotfile ~/dotfiles/.bashrc ~/.bashrc
symlink_dotfile ~/dotfiles/env_vars.sh ~/env_vars.sh

symlink_dotfile ~/dotfiles/.xbindkeysrc ~/.xbindkeysrc
symlink_dotfile ~/dotfiles/.Xresources ~/.Xresources

# if Arch linux symlink .yaourtrc


# rofi theme (set manually, use rofi-theme-selector):
# -- lb

XFCE_DIR=".config/xfce4/xfce-perchannel-xml"
mkdir -p $HOME/$XFCE_DIR
#symlink_dotfile ./dotfiles/$XFCE_DIR/xfce4-keyboard-shortcuts.xml $HOME/$XFCE_DIR/xfce4-keyboard-shortcuts.xml


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
