#!/bin/bash
list=`find ./ -name "*.git" -type d | sed 's/\.git$//g'`
start_dir=`pwd`
for d in $list; do
	cd $d
	st=""
	# git status
    git status | grep -q 'Changes to be commited' &&  st="$st[need commit]"
    git status | grep -q 'Your branch is behind' && st="$st[need pull]"
    git status | grep -q 'Untracked files' && st="$st[untracked]"
    git status | grep -q 'Changes not staged for commit' && st="$st[changes not staged]"

	if [ -n "$st" ]; then
		echo $st: $d
	    echo "===================="
	fi
	cd $start_dir
done
