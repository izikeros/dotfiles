#!/bin/bash
NAME=pycharm_professional
docker ps | grep -q $NAME && echo "container already started" || docker start $NAME

