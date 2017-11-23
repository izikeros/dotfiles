dpkg --get-selections > ~/Package.list
sudo cp /etc/apt/sources.list ~/sources.list
sudo apt-key exportall > ~/Repo.keys
rsync --progress /home/`whoami` /path/to/user/profile/backup/here

##  Reinstall now
