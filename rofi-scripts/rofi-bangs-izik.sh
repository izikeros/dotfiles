#!/usr/bin/env bash
# author: unknown
# sentby: MoreChannelNoise (https://www.youtube.com/user/MoreChannelNoise)
# editby: gotbletu (https://www.youtube.com/user/gotbletu)

# demo: https://www.youtube.com/watch?v=kxJClZIXSnM
# info: this is a script to launch other rofi scripts,
#       saves us the trouble of binding multiple hotkeys for each script,
#       when we can just use one hotkey for everything.

declare -A LABELS
declare -A COMMANDS

###
# List of defined 'bangs'
# Dont need to use ; in front if you dont want
###

# below command, type rr to use rofi like dmenu to list apps to launch
COMMANDS["apps"]="rofi -combi-modi window,drun -show combi"
LABELS["apps"]=""

#
# COMMANDS["rr"]="rofi -show run \"\${input}\""
# LABELS["rr"]="rofi-run"

# search notes by title
COMMANDS["wiki"]="find ~/vimwiki/tech -name '*.md' | rofi -i -dmenu | xargs typora"
LABELS["wiki"]=""

# search notes by title
COMMANDS["diary"]="find ~/vimwiki/diary -name '*.md' | rofi -i -dmenu | xargs typora"
LABELS["diary"]=""

# search notes by title
COMMANDS["brain"]="find ~/Documents/brain -name '*.md' | rofi -i -dmenu | xargs typora"
LABELS["brain"]=""

# search notes by title
COMMANDS["jira"]="~/dotfiles/rofi-scripts/rjira.sh"
LABELS["jira"]=""

# search clipboard history (uses green clip)
COMMANDS["clips"]="rofi_run -c"
LABELS["clips"]=""

# search notes by title
# COMMANDS["receipes"]="find /home/safjan/vimwiki/priv/kuchnia  -name '*.md' | rofi -i -dmenu | xargs typora"
# LABELS["receipes"]=""

# search notes by title
COMMANDS["snippets"]="find ~/dotfiles/snippets/my_snippets | rofi -i -dmenu | xargs -I{} cat {} | xclip -selection clipboard"
LABELS["snippets"]=""

# search notes by title
COMMANDS["aliases"]="cat ~/.zsh_aliases | rofi -i -dmenu > /dev/null"
LABELS["aliases"]=""

# not working
COMMANDS["functions"]= "list-functions | rofi -i -dmenu > /dev/null"
LABELS["functions"]=""

# search notes by title
COMMANDS["priv"]="find ~/vimwiki/priv  -name '*.md' | rofi -i -dmenu | xargs typora"
LABELS["priv"]=""

# search local files
COMMANDS["locate"]="~/dotfiles/rofi-scripts/rofi-locate.sh"
LABELS["locate"]=""

# search my github stars
COMMANDS["github"]="cat ~/data/github-izikeros-stars-desc.txt | tr '\t' '^' | cut -f2- -d'^' | tr '^' '\t' | rofi -i -dmenu | tr '\t' '^' | cut -f1 -d'^' | xargs -I{} echo 'https://github.com/{}' | xargs brave"
LABELS["github"]=""

# search my hackernews favs
COMMANDS["hackernews"]="cat ~/data/hn_favs.csv | rofi -i -dmenu | awk -F '\";' '{print $2}' | xargs brave"
LABELS["hackernews"]=""

# play music
COMMANDS["music"]="find ~/Music -name '*.mp3' | grep -v _Other_Audio | rofi -i -dmenu | xargs -I{} parole '{}'"
LABELS["music"]=""

# Search contents
# rg --no-heading www.youtube
# gives results such as:
# projects/wagabunda.md:26:Found Django by example YT tutorial serie (https://www.youtube.com/playlist?list=PLAF3anQEEkzS-mjdX7s-D63bjLWRdhuFM)

# search notes by title
# COMMANDS["travel"]="find /home/safjan/Documents/brain -name '*.md' | rofi -i -dmenu | xargs typora"
# LABELS["travel"]=""

# bash scripts
# aliases
# bash functions
# mman
# tasks
# goals
# snippets
# music
# nokia-bookmarks
# quotes
# hiszpanski

################################################################################
# do not edit below
################################################################################
##
# Generate menu
##
function print_menu()
{
    for key in ${!LABELS[@]}
    do
    
    echo "$key    ${LABELS}"
    #echo "$key    ${LABELS[$key]}"
     # my top version just shows the first field in labels row, not two words side by side
    done
}
##
# Show rofi.
##
function start()
{
    # print_menu | rofi -dmenu -p "?=>"
    print_menu | sort | rofi -dmenu -mesg ">>> launch your collection of rofi scripts" -i -p "rofi-bangs: "

}


# Run it
value="$(start)"

# Split input.
# grab upto first space.
choice=${value%%\ *}
# graph remainder, minus space.
input=${value:$((${#choice}+1))}

##
# Cancelled? bail out
##
if test -z ${choice}
then
    exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}
then
    # Execute the choice
    #eval echo "Executing: ${COMMANDS[$choice]}"
    eval ${COMMANDS[$choice]}
#else
    #eval  $choice | rofi
 # prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK)
 #   echo "Unknown command: ${choice}" | rofi -dmenu -p "error"
fi
