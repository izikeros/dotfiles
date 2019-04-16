#!/bin/bash

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

for dir in $HOME/projects/*/     # list directories in the form "/tmp/dirname/"
do
	proj=${dir%*/}      # remove the trailing "/"
    proj=${proj##*/}	# everything after the final "/"


	if [[ $proj =~ ^\_ ]]; then
	 	a=0
	else
		res=$dir.git/config
	    if [ ! -e $res ]; then
	     	echo "    $bldred$proj$txtrst is not a git repo"
	    fi
	fi
done
