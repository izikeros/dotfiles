#!/bin/zsh

source $HOME/.zsh_functions

YEAR=$(date +%Y)

for ((i=1;i<=10;i++)); do
    offset="-$i"
    dt="$(d_file_offset "$offset")"
    pth="$HOME/vimwiki/diary/$YEAR/$dt.md"

    if [ ! -s "$pth" ];then
        status_txt="-- nothing written in diary for $dt ($offset)"
	    echo "$status_txt"
    fi
done


