#!/bin/bash

#BACKUP_DIR="$HOME/backup"
# exec >> err_file # redirect stdout to logfile
# CMD=`./get_distro_pkg_install_command.sh`

source ./helper_functions.sh

echo "-------- symlinking content from the bulk folder -----------"
B="/home/bulk"
symlink_dotfile $B/Documents ~/Documents
symlink_dotfile $B/Downloads ~/Downloads
symlink_dotfile $B/Dropbox ~/Dropbox
symlink_dotfile $B/Music ~/Music
symlink_dotfile $B/Pictures ~/Pictures
symlink_dotfile $B/src ~/src
