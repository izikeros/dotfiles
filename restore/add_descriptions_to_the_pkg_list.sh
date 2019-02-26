#!/bin/bash
# usage: ./install_from_the_list.sh packages_list.txt [--ask]

PKG_LIST_FILE="$1"
TMP_FILE_IN=/tmp/install_list_in.txt
TMP_FILE_OUT=/tmp/install_list_out.txt
CMD=yay

# remove comments
sed -e "s/#.*$//gi" -e "/^$/d" "$PKG_LIST_FILE" > "$TMP_FILE_IN"

# count packages
N=$(wc -l "$TMP_FILE_IN")

echo "Found $N packages on the list:"

while read -r package;
do
	descr=$($CMD -Si "$package" | grep 'Description' | sed 's/Description\s*:\s*//')
	printf "%-20s # %s\n" "$package" "$descr"
	printf "%-20s # %s\n" "$package" "$descr" >> "$TMP_FILE_OUT"
done < "$TMP_FILE_IN"
rm "$TMP_FILE_IN"
mv "$PKG_LIST_FILE" "$PKG_LIST_FILE.bak"
mv "$TMP_FILE_OUT" "$PKG_LIST_FILE"