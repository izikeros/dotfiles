#!/bin/bash
# helper functions for setup restore

# Logging functions
log_end (){
	>&2 echo "Installed %s" "$1"
	printf "\nInstalled %s" "$1"
	printf "\n======================\n"
}


log_msg () {
	>&2 echo "$1"
}

# Installer function
install_package() {
    $CMD "$1"
	log_end "$1"
}

# symlink and backup if already exist
symlink_dotfile() {
	src="$1"
	dst="$2"

	# make backup of existing file
	#  if regular file or symlink exist - backup it
    if [ -e "$dst" ]
	then
		echo "$dst found."
		dst_backup="$dst.bak"
		echo "  -- moving $dst to $dst_backup"
		mv "$dst" "$dst_backup"
	#else
	#	echo "$2 not found."
	fi
	echo "  -- symlinking $src to $dst"
	ln -s "$src" "$dst"
	echo "done"
    echo
}
