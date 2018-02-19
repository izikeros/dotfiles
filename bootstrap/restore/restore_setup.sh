#!/bin/bash

# not used
#BACKUP_DIR="$HOME/backup"

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

# double commander
DCMDR_PATH=".config/doublecmd"
mkdir -p $HOME/$DCMDR_PATH
symlink_dotfile ./dotfiles/$DCMDR_PATH/doublecmd.xml $HOME/DCMDR_PATH//doublecmd.xml

# rofi theme (set manually, use rofi-theme-selector):
# -- lb 

XFCE_DIR=".config/xfce4/xfce-perchannel-xml"
mkdir -p $HOME/$XFCE_DIR
symlink_dotfile ./dotfiles/$XFCE_DIR/xfce4-keyboard-shortcuts.xml $HOME/$XFCE_DIR/xfce4-keyboard-shortcuts.xml

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

# TODO: symlink snippets

# ======== install omzsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "omzsh should be installed, you might want to switch shell to zsh via command: 'chsh -s /bin/zsh'"

# ======== install z
if [ ! -d ~/z ]; then
    git clone https://github.com/rupa/z ~/z
fi
echo "z installed"

# ======== install fzf
# NOTE: On arch can be installed from packages
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
echo "fzf installed"

# ======= install k
git clone https://github.com/supercrabtree/k $HOME/.oh-my-zsh/custom/plugins/k

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
