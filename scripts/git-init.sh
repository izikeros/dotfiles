#!/usr/bin/env bash
# git-init.sh
# Initialize git repository and perform standardized initial actions
#
# usage: git-init.sh
#
# author: Krystian Safjan (ksafjan@gmail.com)
# Licence MIT

set -e

# Initialize git repository with branch "main"
git init -b main

# Create .gitignore file (if not exists)
touch .gitignore

# Set user info for this repo
git config user.email "ksafjan@gmail.com"
git config user.name "Krystian Safjan"

# Add description file
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

# Initialize README
if [ -f README.md ]; then
	echo Found existing README
else
	dirname=${PWD##*/}
	echo "# $dirname" > README.md
	echo $description >> README.md
fi

# Display git status
git status
