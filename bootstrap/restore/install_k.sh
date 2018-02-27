#!/bin/bash

# ======= install k
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/k ]; then
    git clone https://github.com/supercrabtree/k $HOME/.oh-my-zsh/custom/plugins/k
else
    echo "k plugin already exist, cloning skipped"
fi
echo
