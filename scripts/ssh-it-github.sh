#!/usr/bin/env bash

# if no input provided operate on .git/config (assumming being in main directory of the repo)
GIT_REPO_CONFIG=${1:-".git/config"}

# replacement for repos cloned via https
sed -i 's/url = https:\/\/github.com\//url = github:/' "$GIT_REPO_CONFIG"

# replacement for repos cloned/created via gh cli
sed -i 's/url = git@github.com/url = github/' "$GIT_REPO_CONFIG"
