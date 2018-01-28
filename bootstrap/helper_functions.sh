#!/bin/bash
# helper functions for setup restore

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
    $CMD $1
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