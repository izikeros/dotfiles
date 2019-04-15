#!/bin/zsh
source $HOME/.zsh_functions
f="$(d_file_yesterday).md"
pth="$HOME/vimwiki/diary/"

st='missing'
if [ ! -s "$pth$f" ];then
	    status_txt="-- nothing written in diary for yesterday (d-y | d-ys to edit)"
	    echo "$status_txt"
fi
