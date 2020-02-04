#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt [--ask]
# if there is --ask (or anything else) after filename then youwill be prompted to confirm installation of each package


# TODO: result is save to single list pkg_to_restore, however in use there are two lists

#INPUT_FILE=$1
INPUT_FILE_1=./pkg/ext.txt
INPUT_FILE_2=./pkg/ext-rare.txt


TMP_FILE_LIST=/tmp/pkg_list_restore.txt
TMP_FILE_INSTALLED=/tmp/pkg_list_currently_installed.txt

# Prepare current lists for analysis
# remove comments from the list and remove trailing white spaces
echo "Combining lists: ext.txt and ext-rare.txt"
sed -e "s/#.*$//gi" -e "/^$/d" "$INPUT_FILE_1" | sed 's/\s*$//g'  > $TMP_FILE_LIST
sed -e "s/#.*$//gi" -e "/^$/d" "$INPUT_FILE_2" | sed 's/\s*$//g'  >> $TMP_FILE_LIST

echo "Sorting results"
sort -bufi -o $TMP_FILE_LIST $TMP_FILE_LIST

echo "Creating list of currently installed packages"
# create list from currently installed packages (installed explicite, not as dependency)
# TODO play with option -t, -tt
# -Q: query the database
# -q: quiet
# -g: group
# -d: (deps) Restrict or filter output to packages installed as dependencies.
# -e: (explicit) Restrict or filter output to explicitly installed packages.
# -m: (foreign) Restrict or filter output to packages that were not found in the sync database(s)
pacman -Qqe |  grep -v "$(pacman -Qqm)" | grep -v "$(pacman -Qqg base)" |grep -v "$(pacman -Qqd)" | sed 's/\s*$//g' | sort -f > $TMP_FILE_INSTALLED

echo "Adding descriptions"
./add_package_descriptions.sh $TMP_FILE_LIST
./add_package_descriptions.sh $TMP_FILE_INSTALLED

echo "File with packages from the list:$TMP_FILE_LIST"
echo "File with already installed packages:$TMP_FILE_INSTALLED"

echo "List of packages on your system that are not on the restore list:"
# list names
comm -13 $TMP_FILE_LIST $TMP_FILE_INSTALLED
# count
comm -13 $TMP_FILE_LIST $TMP_FILE_INSTALLED | wc -l

echo ""
echo "Running Meld for list comparison"
meld $TMP_FILE_LIST $TMP_FILE_INSTALLED

cat $TMP_FILE_LIST

echo "If list list looks fine, copy it to dotfiles:"
echo "cp $TMP_FILE_LIST $INPUT_FILE"
