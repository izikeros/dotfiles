#!/usr/bin/env bash

# exit when any command fails
set -e

# initialize
echo "-- initializing local git repo"
git init -b main

# set user
git config user.email "ksafjan@gmail.com"
git config user.name "Krystian Safjan"
echo "-- setting user data"

echo "-- creating github repo: $DIR_NAME"
DIR_NAME=${PWD##*/}

# git pull --set-upstream origin main

gh repo create "$DIRNAME" --private

# create .gitignore
echo "-- creating .gitignore"
touch .gitignore

# add all files, commit and push
echo "-- add all files, commit and push"
git add . && git commit -m "initial commit" && git push

echo "-- setting upstream"
# git set-upstream is a git alias
git set-upstream

echo "-- setting authentication with the ssh-keys"
# set ssh authentication
sed -i 's/url = https:\/\/github.com\//url = github:/'
