#!/bin/bash

# ======= install Dropbox
if hash dropbox 2>/dev/null; then
	echo "Seems that Dropbox is already installed"
else
	echo "Installing Dropbox"
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
fi
# TODO: if not running dropbox then run it
# run Dropbox
~/.dropbox-dist/dropboxd &
