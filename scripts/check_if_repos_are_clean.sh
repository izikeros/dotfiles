#!/usr/bin/env sh
list=(~/dotfiles /home/bulk/Dockerfiles)

for repo in "${list[@]}"
do
    cwd=`pwd`
    cd $repo
    git status | grep -q "nothing to commit, working tree clean" && st="clean" || st="dirty"

    if [ $st == 'dirty' ];then
        echo "-- git repo: $repo is dirty"
    fi
done
cd $cwd
