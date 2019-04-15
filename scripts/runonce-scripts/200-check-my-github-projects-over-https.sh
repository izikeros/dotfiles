#!/bin/bash
# list projects from my github configured to be accessed via https instead of ssh

res=$(ls "$HOME"/projects/*/.git/config | xargs grep 'https:\/\/github\.com\/izikeros')

if [ ! -z "$res" ]; then
    echo "-- consider configuring ssh access for these projects:"
    echo "$res"
fi

