#!/bin/sh
#https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages
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
	#ln -s $src $dst
	echo "done"
}

# add ppa repositories
# TODO:

# /etc/hosts
# /etc/fstab
# veracrypt volumes

log_msg "Updating repo list"
#apt-get update

log_msg "Setting up configuration/dotfiles"
apt-get install -y git
git clone https://github.com/izikeros/dotfiles.git

# install minimal set of packages from curated list
log_msg "Initiating install of basics"

ln -s ./dotfiles/.bashrc ~/.bashrc
chmod 644 ~/.bashrc
log_msg ".bashrc installed"


# TODO:

# install tools from pip packages

# restore docker images

# restore npm packages

# python virtual environments
# - packages from freeze
