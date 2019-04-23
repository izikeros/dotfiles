#!/bin/zsh

source $HOME/.zsh_functions

f="$(d_file_yesterday).md"

pth="$HOME/vimwiki/diary/$f"

if [ ! -s "$pth" ];then
	    status_txt="-- nothing written in diary for yesterday (d-y | d-ys to edit)"
	    echo "$status_txt"
        echo $pth
fi

