#!/usr/bin/env sh
list=(~/dotfiles /home/bulk/Dockerfiles)

for repo in "${list[@]}"
do
    cwd=`pwd`
    cd $repo
    git status | grep -q "nothing to commit, working tree clean" && st="clean" || st="dirty"

    num_commits=`git cherry -v | wc -l`

    push_txt=""
    if [ num_commits > 0 ];then
        push_txt=" # commits to push: $num_commits."
    fi

    status_txt="-- $repo is clean"
    if [ $st == 'dirty' ];then
        status_txt="-- $repo is dirty"
    fi

    echo "$status_txt $push_txt"
done
cd $cwd
