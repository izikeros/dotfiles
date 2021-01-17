#!/usr/bin/env sh

if echo $(safeeyes --status) |grep -q "Safe Eyes is not running"
then
	echo "sEyes: off"
else
	echo "sEyes: on"
fi
#echo $(safeeyes --status)