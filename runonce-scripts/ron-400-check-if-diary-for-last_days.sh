#!/bin/zsh

source $HOME/.zsh_functions

# todo: loop over e.g. last week
for ((i=1;i<=10;i++)); do
    offset="-$i"
    dt="$(d_file_offset "$offset")"

    pth="$HOME/vimwiki/diary/$dt.md"

    if [ ! -s "$pth" ];then
        status_txt="-- nothing written in diary for $dt ($offset)"
	    echo "$status_txt"
    fi
done


