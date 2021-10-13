#!/usr/bin/env python3
"""Clone all gists of GitHub username

Username can be provided from commandline or as environmental variable GITHUB_USER

Use Github CLI to create new gists
===================================
# publish file 'hello.py' as a public gist
$ gh gist create --public hello.py

# create a gist with a description
$ gh gist create hello.py -d "my Hello-World program in Python"

# create a gist containing several files
$ gh gist create hello.py world.py cool.txt

# read from standard input to create a gist
$ gh gist create -

# create a gist from output piped from another command
$ cat cool.txt | gh gist create
"""
import json
import os
import subprocess
import sys
from pathlib import Path

import requests

# gists are stored in ~/gists/gihub_username
HOME_DIR = os.path.expanduser('~')
GIST_DIR = 'gists'

if len(sys.argv) > 1:
    gh_user = sys.argv[1]
else:
    if "GITHUB_USER" in os.environ:
        gh_user = os.environ["GITHUB_USER"]
    else:
        print("Usage: gist-backup.py github_username")
        exit(1)

r = requests.get("https://api.github.com/users/%s/gists" % gh_user)
if r:
    print(f"Found: {len(r.json())} gists. Clonning")
else:
    print(f"Gists of user: {gh_user} not found.")
    exit(1)


class cd:
    """Context manager for changing the current working directory"""

    def __init__(self, newPath):
        self.newPath = os.path.expanduser(newPath)

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)



user_gist_dir_name = Path(home_dir) / "gists" / gh_user

Path(user_gist_dir_name).mkdir(parents=True, exist_ok=True)

contents = {}
with cd(user_gist_dir_name):
    for i in r.json():
        description = i["description"] if i["description"] else i["id"]
        subprocess.call(["git", "clone", i["git_pull_url"]])

        description_file = f"./{i['id']}/description.txt"
        with open(description_file, "w") as f:
            f.write("{0}\n".format(i["description"]))
        contents[i["id"]]={}
        contents[i["id"]]["git_pull_url"] = i["git_pull_url"]
        contents[i["id"]]["description"] = description
    with open("contents.json", "wt") as cf:
        json.dump(contents, cf)
