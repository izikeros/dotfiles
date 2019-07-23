#!/bin/bash
set -e

# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install (run code in subshell)
(
cd fonts || exit
./install.sh
# clean-up a bit
)
rm -rf fonts

echo "### Powerline fonts installed"
