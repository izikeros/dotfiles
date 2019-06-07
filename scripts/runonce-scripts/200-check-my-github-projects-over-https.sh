#!/bin/bash
# list projects from my github configured to be accessed via https instead of ssh

if [ -d "$HOME"/projects/_priv/ ]; then
    res=$(ls "$HOME"/projects/_priv/*/.git/config | xargs grep 'https:\/\/github\.com\/izikeros')

    if [ -n "$res" ]; then
        echo "-- consider configuring ssh access for these projects:"
        echo "$res"
    fi
fi
