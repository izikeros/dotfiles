#!/bin/bash

# Making sure firefox looks great in dark themes

# Firefox need to be launched at least once.
# The directory will not exist otherwise."

sh firefox &
sleep 1
killall firefox

src_dir="$HOME/dotfiles"

cp -r $src_dir/settings/firefox/chrome/ ~/.mozilla/firefox/*.default

echo "Restart firefox to see the effect"

