#!/usr/bin/bash
#
# Script that provides info on set of repositories
#
# usage:
# 	ron-100-check-if-repos-are-clean.sh dir_to_examine
#
# Examine content of directories in given location
# providing info:
# - repository status: clean | dirty | not repo
# - remote location
# - user name
# TODO: add dir size

# Text color variables
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldblu=${txtbld}$(tput setaf 4) #  blue
bldwht=${txtbld}$(tput setaf 7) #  7-gray, 15-white
bldorg=${txtbld}$(tput setaf 3) #  orange
txtrst=$(tput sgr0)             # Reset

if [ -z "$1" ]; then
	# if no input dir provided add dotfiles and projects/priv
	list=("$HOME"/dotfiles)
	list+=($(ls -d "$HOME"/projects/priv/*))
else
	# otherwise, examine provided dir
	list=$1
fi

# define coloured messages for the status
st_clean="$bldwht[clean ]$txtrst"
st_dirty="$bldred[dirty ]$txtrst"
st_n_git="$bldorg[norepo]$txtrst"

for repo in "${list[@]}"
do
	# echo $repo
	cwd=$(pwd)
	num_commits_text=""
    hosting=""
    repo_col=""
    repo_col=$bldblu$repo$txtrst
    if [ -d "$repo" ]; then
		if [ -d "$repo"/.git ]; then

			cd "$repo" || exit
			# extract hostname from line containing '.git' text
			hosting=$(grep ".git" ./.git/config | grep -v "^\s.*#" | sed 's/http:\/\///' | sed 's/https:\/\///' | awk -F"/" '{print $1}' | awk -F":" '{print $1}' | awk -F"=" '{print $2}')
			
			# extract user email
			email=$(grep "email" ./.git/config | grep -v "^\s.*#" | awk -F"=" '{print $2}')

			#echo $hosting
			#grep ".git" ./.git/config
			git status | grep -q "nothing to commit, working tree clean" && st="clean" || st="dirty"
			num_commits=$(git cherry -v | wc -l)

			# repo size
			repo_size=$(du -sh . | tr '\t' ' ' | cut -d' ' -f1)

			if [ "$num_commits" -gt 0 ];then
				num_commits_text=" # commits to push: $txtbld$num_commits.$txtrst"
			fi

			# Display text for clean repos
			if [ $st = 'clean' ];then
				status_txt="$st_clean $repo_size $repo_col [$hosting] [$email]"
				echo "[100] $status_txt  $num_commits_text"
			fi

			# Display text for dirty repos
			if [ $st = 'dirty' ];then
		    	status_txt="$st_dirty $repo_size $repo_col"
		    	echo "[100] $status_txt $num_commits_text [$hosting] [$email]"
			fi

		else
			# Display text for non-git repos
			status_txt="$st_n_git $repo_size $repo_col"
			echo "[100] $status_txt $num_commits_text"
		fi
    fi
done
cd "$cwd" || exit
