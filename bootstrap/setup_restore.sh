#!/bin/sh
#https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages

BACKUP_DIR="$HOME/backup"

exec >> err_file

# Logging functions
log_end (){
	>&2 echo "Installed "$1
	echo "\nInstalled "$1
	echo "\n======================\n"
}

log_msg () {
	>&2 echo $1
}

# Installer function
install_package() {
	apt-get install $1 -y
	log_end $1
}

symlink_dotfile() {
	src=$1
	dst=$2

	#make backup of existing file
	if [ -f "$dst" ]
	then
		echo "$dst found."
		dst_backup="$dst.bak"
		echo "moving $dst to $dst_backup"
		#mv $dst $
	else
		echo "$2 not found."
	fi
	echo "symlinking $src to $dst"
	ln -s $src $dst
	echo "done"
}

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

# install Dropbox
if hash dropbox 2>/dev/null; then
	echo "Seems that Dropbox is already installed"
else
	echo "Installing Dropbox"
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -    date "$@"
fi
# run Dropbox
#~/.dropbox-dist/dropboxd &

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


# install omzsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "omzsh should be installed, you might want to switch shell to zsh via command: 'chsh -s /bin/zsh'"

# install z
if [ ! -d ~/.z ]; then
    git clone https://github.com/rupa/z
fi
echo "z installed"

# install tools from pip packages

# restore docker images

# restore npm packages

# python virtual environments
# - packages from freeze
