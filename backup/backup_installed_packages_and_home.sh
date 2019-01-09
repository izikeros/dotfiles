#!/usr/bin/env sh
# create list of installed deb packages, sources listm and keys. Finally backup
# whole home directory of the user
dpkg --get-selections > ~/Package.list
sudo cp /etc/apt/sources.list ~/sources.list
sudo apt-key exportall > ~/Repo.keys
rsync --progress /home/`whoami` /path/to/user/profile/backup/here

##  Reinstall now
