#!/bin/bash
DATE=$(date  +%Y-%m)
git log --pretty=format:"%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short --since='1 month' | grep "Krystian Safjan" | grep "$DATE" > ~/Documents/taxbreak/${DATE}_taxbreak.txt
