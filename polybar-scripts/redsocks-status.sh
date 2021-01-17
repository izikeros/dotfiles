#!/usr/bin/env sh

if pgrep -x "redsocks" > /dev/null
then
    echo "Rs: on"
else
    echo "Rs: off"
fi

