#!/usr/bin/env sh

case "$1" in
    --toggle)
        if [ "$(pgrep dropbox)" ]; then
            pkill -f dropbox
        else
            dropbox &
        fi
        ;;
    *)
        if [ "$(pgrep dropbox)" ]; then
            echo "Dropbox"
        else
            echo "no-Dropbox"
        fi
        ;;
esac
