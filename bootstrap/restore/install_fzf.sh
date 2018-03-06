#!/bin/bash
# ======== install fzf
# NOTE: On arch can be installed from packages
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo "fzf installed"
else
    echo "~/.fzf directory already exist, skipping cloning and installation"
fi
echo