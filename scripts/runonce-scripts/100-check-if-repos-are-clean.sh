#!/usr/bin/bash
# Text color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldblu=${txtbld}$(tput setaf 4) #  blue
bldwht=${txtbld}$(tput setaf 7) #  7-gray, 15-white
bldorg=${txtbld}$(tput setaf 3) #  orange
txtrst=$(tput sgr0)             # Reset
info=${bldwht}*${txtrst}        # Feedback
pass=${bldblu}*${txtrst}
warn=${bldred}*${txtrst}
ques=${bldblu}?${txtrst}

if [ -z $1 ]; then
	list=($HOME/dotfiles)
	list+=($(ls -d $HOME/projects/priv/*))
else
	list=$1
fi

st_clean="$bldwht[clean ]$txtrst"
st_dirty="$bldred[dirty ]$txtrst"
st_n_git="$bldorg[not repo]$txtrst"

for repo in "${list[@]}"
do
	# echo $repo
	cwd=`pwd`
	push_txt=""
    hosting=""
    repo_col=""
    repo_col=$bldblu$repo$txtrst
    if [ -d $repo ]; then
		if [ -d $repo/.git ]; then

			cd $repo
			hosting=$(grep ".git" ./.git/config | grep -v "^\s.*#" | sed 's/http:\/\///' | sed 's/https:\/\///' | awk -F"/" '{print $1}' | awk -F":" '{print $1}' | awk -F"=" '{print $2}')
			email=$(grep "email" ./.git/config | grep -v "^\s.*#" | awk -F"=" '{print $2}')

			#echo $hosting
			#grep ".git" ./.git/config
			git status | grep -q "nothing to commit, working tree clean" && st="clean" || st="dirty"
			num_commits=`git cherry -v | wc -l`

			if [ $num_commits -gt 0 ];then
				push_txt=" # commits to push: $txtbld$num_commits.$txtrst"
			fi

			if [ $st = 'clean' ];then
				status_txt="$st_clean $repo_col [$hosting] [$email]"
				echo "[100] $status_txt $push_txt"
			fi
			if [ $st = 'dirty' ];then
		    	status_txt="$st_dirty $repo_col"
		    	echo "[100] $status_txt $push_txt [$hosting] [$email]"
			fi

		else
			status_txt="$st_n_git $repo_col"
			echo "[100] $status_txt $push_txt"
		fi
    fi
done
cd $cwd
