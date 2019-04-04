#!/bin/sh

if pgrep -x "redsocks" > /dev/null
then
    echo "Redsocks: Running"
else
    echo "Redsocks: Stopped"
fi

