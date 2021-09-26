#!/usr/bin/env bash
# git-init.sh
# Initialize git repository and perform standardized initial actions
#
# usage: git-init.sh
#
# author: Krystian Safjan (ksafjan@gmail.com)
# Licence MIT

set -e

git init -b main
touch .gitignore
git config user.email "ksafjan@gmail.com"
git config user.name "Krystian Safjan"

# Add description
echo Current project description in .git/description:
cat .git/description

echo "Please provide short description of the project:"
read description

if [ -z "$description" ]; then
  echo No description provided
else
  echo $description > .git/description
  echo description written to the .git/description	
fi

# TODO: ask if initialize readme

if [ -f README.md ]; then
	echo Found existing README
else
	dirname=${PWD##*/}
	echo "# $dirname" > README.md
	echo $description >> README.md

# Status
git status