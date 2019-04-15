#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt [--ask]
# if there is --ask (or anything else) after filename then youwill be prompted to confirm installation of each package

#INPUT_FILE=$1
INPUT_FILE_1=./pkg/ext.txt
INPUT_FILE_2=./pkg/ext-rare.txt


TMP_FILE_LIST=/tmp/pkg_list_restore.txt
TMP_FILE_INSTALLED=/tmp/pkg_list_currently_installed.txt

# remove comments from the list and remove trailing white spaces
sed -e "s/#.*$//gi" -e "/^$/d" "$INPUT_FILE_1" | sed 's/\s*$//g'  | sort -f > $TMP_FILE_LIST
sed -e "s/#.*$//gi" -e "/^$/d" "$INPUT_FILE_2" | sed 's/\s*$//g'  | sort -f >> $TMP_FILE_LIST


# create list from currently installed packages (installed explicite, not as dependency)
# TODO play with option -t, -tt
pacman -Qqe |  grep -v "$(pacman -Qqm)" | grep -v "$(pacman -Qqg base)" |grep -v "$(pacman -Qqd)" | sed 's/\s*$//g' | sort -f > $TMP_FILE_INSTALLED

echo "packages on your system that are not on the restore list:"
#comm -13 $TMP_FILE_LIST $TMP_FILE_INSTALLED

#comm -13 $TMP_FILE_LIST $TMP_FILE_INSTALLED | wc -l
#echo ""
#echo "Running Meld for list comparison"
#meld $TMP_FILE_LIST $TMP_FILE_INSTALLED

#./add_package_descriptions.sh $TMP_FILE_LIST

#cat $TMP_FILE_LIST

#echo "If list list looks fine, copy it to dotfiles:"
#echo "cp $TMP_FILE_LIST $INPUT_FILE"
