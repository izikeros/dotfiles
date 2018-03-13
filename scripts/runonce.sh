#!/bin/bash

help_and_exit() {
    cat << EOF
${0##*/} [options] COMMAND

Run COMMAND but only once per interval. See '$HOME/.runonce-*' for lock files.

  options:
    -h, -?      help
    -i MINS  	interval in minutes (default 480)
EOF

    exit $1
}

# A POSIX variable
OPTIND=1    # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
interval=480 # minutes

# getops can't handle long options (--help) but can handle options clustering
# (-vf FILE)
while getopts "h?i:" opt; do
    case "$opt" in
    h|\?)
        help_and_exit 0
        ;;
    i)  interval=$OPTARG
        ;;
    esac
done

# Shift off the options and optional --
shift $((OPTIND-1))
[ "$1" = "--" ] && shift

if [[ "X" == "X$@" ]]; then
    help_and_exit 1
fi

MYBASENAME="$(basename $(echo -n $@ | cut -d" " -f1))"
lock="$HOME/.runonce-$MYBASENAME-$(echo -n $@|md5sum|cut -d" " -f1)"
if [[ ! -e $lock ]]; then
    "$@"
    touch $lock
else # lock exists
    if [[ "`find $lock -mmin +$interval`" ]]; then
        "$@"
        touch $lock
    fi
fi
