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

# symlink and backup if already exist
symlink_dotfile() {
	src=$1
	dst=$2

	#make backup of existing file
	if [ -f "$dst" ]
	then
		log_msg("$dst found.")
		dst_backup="$dst.bak"
		log_mgs("moving $dst to $dst_backup")
		mv $dst $
	else
		echo log_msg("$2 not found.")
	fi
	echo log_msg("symlinking $src to $dst")
	ln -s $src $dst
	echo log_msg("done")
}