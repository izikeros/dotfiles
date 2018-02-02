#!/bin/bash
# uses:

list_ppa_all(){
	# Script to get all the PPA installed on a system
	for APT in `find /etc/apt/ -name \*.list`; do
	    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
	        HOST=`echo $ENTRY | cut -d/ -f3`
	        USER=`echo $ENTRY | cut -d/ -f4`
	        PPA=`echo $ENTRY | cut -d/ -f5`
	        #echo sudo apt-add-repository ppa:$USER/$PPA
	        if [ "ppa.launchpad.net" = "$HOST" ]; then
	            echo sudo apt-add-repository ppa:$USER/$PPA
	        else
	            echo sudo apt-add-repository \'${ENTRY}\'
	        fi
	    done
	done
}

# path to bootstrap catalog (catalog with setup save/restore tools)
B_PATH="~/dotfiles/bootstrap"

# directory to store migration data
SETTINGS_DIR="$HOME/system_settings_new"
 #SETTINGS_DIR=~/Dropbox/system_settings/

echo "====== BACKING UP SYSTEM SETTINGS TO RESTORE LATER =="
echo "making directory for settings: $SETTINGS_DIR"
mkdir -p $SETTINGS_DIR
#mkdir $SETTINGS_DIR | echo "Settings dir: $SETTINGS_DIR already exists. Aborting!"

#### PACKAGES
echo
echo "backing-up list of installed packages"
# --- list user installed packages
#echo $(~/dotfiles/manual_packages.sh) #>  $SETTINGS_DIR/manual_packages.txt
list1="$SETTINGS_DIR/packages_manual.txt"
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) >  $list1
echo "  list: $list1 created"
# list of manually installed packages (ommit depended packages)
list2="$SETTINGS_DIR/packages_manual_alternative.txt"
aptitude --disable-columns -F 'no_dependents %p' search '~i!~M!~R(~i)' | cut -d' ' -f2 > $list2
echo "  list: $list2 created"
#TODO: combine list1 and list2?

#list of all packages in the system
list3=$SETTINGS_DIR/packages_all.txt
dpkg -l | cut -d' ' -f3 > $list3
echo "  list: $list3 created"

# ADDITIONAL info (not needed got restore):
# list all git repositories in home directory
# but reinstallation of some tools might be required
find ~/ -name .git > $SETTINGS_DIR/git_repos.txt

#### HISTORY FILES
# history files
cp ~/.zsh_history $SETTINGS_DIR  || echo "WARNING: .zsh_history not backed-up"
cp ~/.bash_history $SETTINGS_DIR || echo "WARNING: .bash_history not backed-up"
cp ~/.psql_history $SETTINGS_DIR || echo "WARNING: .psql_history not backed-up"
# TODO: fish history
# TODO: pack and crypt them


#### SSH settings and keys
#cp .ssh $SETTINGS_DIR

#### ETC
ETC_BACKUP="$SETTINGS_DIR/etc"
mkdir -p $ETC_BACKUP
mkdir -p "$ETC_BACKUP/apt"
echo
echo "copying sources.list"
cp /etc/apt/sources.list $SETTINGS_DIR/etc/apt
echo "copy PPA repositories list"
ls /etc/apt/sources.list.d > $SETTINGS_DIR/etc/apt/ppa_repositories.txt
# create script for adding ppa repositories
echo "creating PPA install script"
list_ppa_all | grep -v ubuntu.com | grep -v canonical.com > $SETTINGS_DIR/etc/apt/ppa_install_all.sh
chmod +x $SETTINGS_DIR/etc/apt/ppa_install_all.sh

#### PIP
echo
echo "saving list of pip packages installed systemwide"
pip freeze > $SETTINGS_DIR/pip_systemwide_requrements.txt

### VIRTUAL ENVS:
echo
echo "saving requirements from virtual environments:" 
VE_DIR=$HOME/.virtualenvs
ESCAPED_VE_DIR="\/home\/$USER\/\.virtualenvs"
VE_BACKUP_DIR="virtualenvs_requirements"
VE_LIST_FILE="$SETTINGS_DIR/pip_virtualenv_list.txt"
VIRT_ENVS_PATH=`find $VE_DIR -maxdepth 1 -type d`
find $VE_DIR -maxdepth 1 -type d | sed "s/$ESCAPED_VE_DIR//" | sed "s/^\///" > $VE_LIST_FILE

# prepare dir for requirements of each virtual env
mkdir -p $SETTINGS_DIR/$VE_BACKUP_DIR

# loop over all envs and create requirements.txt
cat $VE_LIST_FILE | while read line
do
	[ -z "$line" ] && continue
	echo " -- $line"
	source "$VE_DIR/$line/bin/activate"
	pip freeze > "$SETTINGS_DIR/$VE_BACKUP_DIR/$line.requirements.txt"
	deactivate
done
echo done


### backup files from /etc/:
echo
echo "copying files from /etc/"
echo " -- copying fstab"
cp /etc/fstab $ETC_BACKUP
echo " -- copying hosts"
cp /etc/hosts $ETC_BACKUP
echo "done"
### backup VPN settings

# compress all and store on dropbox
echo "copying settings to dropbox"
BACKUP_NAME="system_settings.tar"
tar -cf  ~/Dropbox/$BACKUP_NAME $SETTINGS_DIR

### NPM
echo
echo "backing up npm packages list [TODO]"

## DOCKER images
echo
echo "backing up list of docker images [TODO]"

## DOCKER containers
echo
echo "backing up docker containers [TODO]"

## JUPYTER EXTENSIONS AND MAGIC
echo
echo "backing up jupyter extensions and magic [TODO]"


# TODO: check if github dotfiles repo is up to date
echo "DONE."sdf