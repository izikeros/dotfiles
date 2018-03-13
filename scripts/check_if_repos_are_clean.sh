#!/usr/bin/env sh
list=(~/dotfiles /home/bulk/Dockerfiles)

for repo in "${list[@]}"
do
    echo "-- check if git repo: $repo is clean"
done
