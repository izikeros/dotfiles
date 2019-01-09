#!/bin/bash

#BACKUP_DIR="$HOME/backup"
# exec >> err_file # redirect stdout to logfile
# CMD=`./get_distro_pkg_install_command.sh`

#shellcheck src=./helper_functions.sh
source ./helper_functions.sh

B="/home/bulk"
symlink_dotfile "$B/Dropbox/vimwiki" "$HOME/vimwiki"


