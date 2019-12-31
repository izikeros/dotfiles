#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt [--ask]
# if there is --ask (or anything else) after filename then youwill be prompted to confirm installation of each package

#INPUT_FILE=$1
INPUT_FILE=./pkg/aur.txt


TMP_FILE_LIST=/tmp/pkg_list_restore.txt
TMP_FILE_INSTALLED=/tmp/pkg_list_currently_installed.txt


# remove comments from the list and remove trailing white spaces
sed -e "s/#.*$//gi" -e "/^$/d" "$INPUT_FILE" | sed 's/\s*$//g'  | sort > $TMP_FILE_LIST


# create list from currently installed AUR packages (installed explicite, not as dependency)
pacman -Qqme | sed 's/\s*$//g' | sort > $TMP_FILE_INSTALLED

echo "AUR packages on your system that are not on the restore list:"
comm -13 $TMP_FILE_LIST $TMP_FILE_INSTALLED

echo ""
echo "Running Meld for list comparison  left: list | right: installed"
echo "Make editions to the left pannel (list from file)"
meld $TMP_FILE_LIST $TMP_FILE_INSTALLED

./add_package_descriptions.sh $TMP_FILE_LIST

# remove duplicates from the list
sort -uo $TMP_FILE_LIST $TMP_FILE_LIST

cat $TMP_FILE_LIST

echo "If list list looks fine, copy it to dotfiles:"
echo "cp $TMP_FILE_LIST $INPUT_FILE"
