#!/usr/bin/env bash
# source: https://linuxbbq.org/bbs/viewtopic.php?t=2641

declare -A LABELS
declare -A COMMANDS
browser='chromium --disk-cache-dir=/tmp/cache'
###
# List of defined 'bangs'
# Dont need to use ; in front if you dont want
###

# below command, type rr to use rofi like dmenu to list apps to launch

COMMANDS["rr"]="rofi -show run \"\${input}\""
LABELS["rr"]="rofi-run"

#############
# below a webbookmarks script is called
COMMANDS["rb"]=" '/home/dka/bin/rofi-scripts/rofi-bookmarks' \"\${input}\""
LABELS["rb"]="rofi-bookmarks"

#below test of running a script to run double commander
COMMANDS["dc"]="'/home/dka/bin/startdc'"
LABELS["dc"]=""

COMMANDS["iv"]="'/home/dka/bin/run-geeqie'"
LABELS["iv"]=""

#my open private folder script
COMMANDS["open-pf"]="  '/home/dka/bin/rofi-scripts/open-pf'"
LABELS["open-pf"]=""

COMMANDS["close-pf"]="  '/home/dka/bin/rofi-scripts/close-pf'"
LABELS["close-pf"]=""

# highlight a video link and run this script
COMMANDS["watchit"]="  '/home/dka/bin/rofi-scripts/watchit'"
LABELS["watchit"]=""

# call an address book script
COMMANDS["address-bk"]=" urxvt -e '/home/dka/bin/rofi-scripts/address-bk'"
LABELS["address-bk"]=""

COMMANDS["urlshorten"]="  '/home/dka/bin/rofi-scripts/url-shorten'"
LABELS["urlshorten"]=""

COMMANDS["radio4"]="  urxvt -e '/home/dka/bin/radio4'"
LABELS["radio4"]=""

# Call another rofi script, rofi notes
COMMANDS["rn"]=" '/home/dka/bin/rofi-scripts/rofi-notes' \"\${input}\""
LABELS["rn"]="rofi-notes"

COMMANDS["todo"]=" '/home/dka/bin/rofi-scripts/todo.sh'"
LABELS["todo"]="todo"

COMMANDS["edit-todos"]="leafpad   '/home/dka/.rofi_todo'"
LABELS["edit-todos"]="edit-todos"


COMMANDS["suspend"]="rofi-suspend \"\${input}\""
LABELS["suspend"]="suspend"

#google maps, type gmps blackpool or whatever!
COMMANDS["gmps"]="$browser https://www.google.nl/maps/place/\" \${input}\""
LABELS["gmps"]="gmaps"

# type web and then webaddress, ie web youtube.com
COMMANDS["web"]="chromium --disk-cache-dir=/tmp/cache \"\${input}\""
LABELS["web"]=""
# google search
COMMANDS["gs"]="$browser  www.google.com/search?q=\  \" \${input}\""
LABELS["gs"]="Web search"
#search IMBD
COMMANDS["movie"]="$browser http://www.imdb.com/find?q=\" \${input}\""
LABELS["movie"]="movie search"
#search instructables
COMMANDS["inst"]="chromium --disk-cache-dir=/tmp/cache http://www.instructables.com/tag/?q=\" \${input}\""
LABELS["inst"]="instructables"
#search archwiki
COMMANDS["archwiki"]="$browser https://wiki.archlinux.org/index.php/\" \${input}\""
LABELS["archwiki"]=""

COMMANDS["piratebay"]="chromium --disk-cache-dir=/tmp/cache http://thepiratebay.org/search/\" \${input}\""
LABELS["piratebay"]=""

COMMANDS["stackexchange"]="chromium --disk-cache-dir=/tmp/cache http://stackexchange.com/search?q=\" \${input}\""
LABELS["stackexchange"]=""

COMMANDS["rofi-keys"]="leafpad  '/home/dka/bin/rofi-scripts/rofi-keybindings.txt'"
LABELS["rofi-keys"]=""

COMMANDS["edit-rofibangs"]="geany  '/home/dka/bin/rofi-scripts/rofi-bangs'"
LABELS["edit-rofibangs"]=""

COMMANDS["funny"]="leafpad  '/home/dka/text-files/funnysymbols.txt'"
LABELS["funny"]="funny symbols"

COMMANDS["fsearch"]="fsearch"
LABELS["fsearch"]=""

COMMANDS["qutebrowser"]="qutebrowser"
LABELS["qutebrowser"]="qutebrowser"


COMMANDS["keepassx"]="keepassx "
LABELS["keepassx"]=


COMMANDS["cs5"]='/home/dka/bin/cs5-Portable'
LABELS["cs5"]=

COMMANDS[".bin"]="spacefm -r '/home/dka/bin'"
LABELS[".bin"]=".bin"

COMMANDS[".downloads"]="spacefm -r '/home/dka/Downloads'"
LABELS[".downloads"]=".downloads"

# WEB SITES but can type rb to use rofi-bookmarks script that has more in the list than these few
COMMANDS["weer"]="chromium --disk-cache-dir=/tmp/cache http://www.buienradar.nl/weer/huizen/nl/2753468/3uurs"
LABELS["weer"]=

COMMANDS["wyt"]="$browser http://www.youtube.com"
LABELS["wyt"]=

COMMANDS["wbq"]="$browser http://linuxbbq.org/bbs/index.php?sid=e878fa6ab8409d0bfea986c99a4f4c06"
LABELS["wbq"]=

COMMANDS["wbol"]="$browser http://www.boll.com"
LABELS["wbol"]=

COMMANDS["whotmail"]='chromium --disk-cache-dir=/tmp/cache www.hotmail.com'
LABELS["whotmail"]=""
#
#####################################
# putting a # in front of the ones that call scripts, just a test ,not needed

#for password retrieval
COMMANDS["#snippypw"]=" '/home/dka/bin/rofi-scripts/snippypw'"
LABELS["#snippypw"]=""

COMMANDS["#screenshot"]='/home/dka/bin/screenshot-scripts/myscreenshot.sh'
LABELS["#screenshot"]="screenshot"

COMMANDS["#editconfigs"]='/home/dka/bin/edit-configs-and-scripts'
LABELS["#editconfigs"]="edit"

COMMANDS["#mounttemple"]='echo mysecretpass | encfs -S /media/ElementsA/new-temple/.new-temple_encfs /media/ElementsA/templemount/'
LABELS["#mounttemple"]="#mounttemple"

COMMANDS["#unmounttemple"]='fusermount -u  /media/ElementsA/templemount'
LABELS["#unmounttemple"]="#unmounttemple"
##sign in to hotmail
COMMANDS["#hmsignin"]='sleep 5s;xdotool type 'myname';sleep 0.5s;xdotool key 132;xdotool type 'hotmail.co.uk';xdotool key Tab;xdotool type 'mygreatpassword';xdotool key "Return"'
LABELS["#hmsignin"]="#hmsignin"



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
     #   echo "$key    ${LABELS[$key]}"
     # my top version just shows the first field in labels row, not two words side by side
    done
}
##
# Show rofi.
##
function start()
{
    print_menu | rofi -dmenu -p "?=>"
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
    eval echo "Executing: ${COMMANDS[$choice]}"
    eval ${COMMANDS[$choice]}
else
	eval  $choice | rofi
 # prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK)
 #   echo "Unknown command: ${choice}" | rofi -dmenu -p "error"
fi
