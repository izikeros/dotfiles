#!/bin/zsh
source $HOME/.zsh_functions
f="$(d_file_yesterday).md"
pth="$HOME/vimwiki/diary/"

if [[ -s "$pth$f" ]];then
    a=0
    echo "there is dirary"
else
	    status_txt="-- nothing written in diary for yesterday (d-y | d-ys to edit)"
	    echo "$status_txt"
fi
