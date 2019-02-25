#!/usr/bin/env sh
# Text color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldblu=${txtbld}$(tput setaf 4) #  blue
bldwht=${txtbld}$(tput setaf 7) #  white
txtrst=$(tput sgr0)             # Reset
info=${bldwht}*${txtrst}        # Feedback
pass=${bldblu}*${txtrst}
warn=${bldred}*${txtrst}
ques=${bldblu}?${txtrst}

list=(~/dotfiles /home/bulk/dockerfiles)

for repo in "${list[@]}"
do
    cwd=`pwd`
    if [ -d $repo ]; then
		cd $repo
		git status | grep -q "nothing to commit, working tree clean" && st="clean" || st="dirty"

		num_commits=`git cherry -v | wc -l`

		push_txt=""
		if [ $num_commits -gt 0 ];then
	    	    push_txt=" # commits to push: $txtbld$num_commits.$txtrst"
		fi

		status_txt="-- $bldblu$repo$txtrst is clean"
		if [ $st == 'dirty' ];then
	    	    status_txt="-- $bldblu$repo$txtrst is $bldred dirty$txtrst"
		fi

		echo "$status_txt $push_txt"
    fi
done
cd $cwd
