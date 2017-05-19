#prepare for migration
 SETTINGS_DIR=~/system_settings/
 echo "making directory for settings: $SETTINGS_DIR"
 mkdir $SETTINGS_DIR

#### PACKAGES
# --- list user installed packages
#echo $(~/dotfiles/manual_packages.sh) #>  $SETTINGS_DIR/manual_packages.txt

# list of manually installed packages (ommit depended packages)
aptitude --disable-columns -F 'no_dependents %p' search '~i!~M!~R(~i)' | cut -d' ' -f2 > $SETTINGS_DIR/manual_packages_alternative.txt

#list of all packages in the system
dpkg -l | cut -d' ' -f3 > $SETTINGS_DIR/all_packages.txt

# list all git repositories in currenr=t working directory
find ~/ -name .git > $SETTINGS_DIR/git_repos.txt

#### REPOSITORIES
echo "copy sources.list"
cp /etc/apt/sources.list $SETTINGS_DIR
echo "copy PPA repositories list"
ls /etc/apt/sources.list.d > $SETTINGS_DIR/ppa_repositories.txt
