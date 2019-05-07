#!/bin/sh

if pgrep -x "redsocks" > /dev/null
then
    echo "Redsocks: on"
else
    echo "Redsocks: off"
fi

