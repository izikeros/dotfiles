#!/usr/bin/env bash

# exit when any command fails
set -e

# initialize
echo "-- initializing local git repo"
git init -b main

# set user
echo "-- setting user data"
git config user.email "ksafjan@gmail.com"
git config user.name "Krystian Safjan"


DIR_NAME=${PWD##*/}
echo "-- creating github repo: $DIR_NAME"
gh repo create "$DIRNAME" --private

# git pull --set-upstream origin main

echo "-- creating .gitignore"
# ensure that .git is ignored and will not be added


# set upstream
#echo "-- setting upstream"
#git branch --set-upstream-to=origin/main main

echo "-- add all files, commit and push"
# add all files, commit and push
git add . && git commit -m "initial commit" && git push

echo "-- setting upstream"
# git set-upstream is a git alias
git set-upstream

echo "-- setting authentication with the ssh-keys"
# set ssh authentication
sed -i 's/url = https:\/\/github.com\//url = github:/'
