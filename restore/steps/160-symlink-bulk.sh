#!/bin/bash

#BACKUP_DIR="$HOME/backup"
# exec >> err_file # redirect stdout to logfile
# CMD=`./get_distro_pkg_install_command.sh`

source ./helper_functions.sh

echo "-------- symlinking content from the bulk folder -----------"
B="/home/bulk"
symlink_dotfile "$B/Documents" "$HOME/Documents"
symlink_dotfile "$B/Downloads" "$HOME/Downloads"
symlink_dotfile "$B/Music" "$HOME/Music"
symlink_dotfile "$B/Pictures" "$HOME/Pictures"
symlink_dotfile "$B/src" "$HOME/src"

echo "Consider symlinking Dropbox also"
# symlink_dotfile "$B/Dropbox" "~/Dropbox"

