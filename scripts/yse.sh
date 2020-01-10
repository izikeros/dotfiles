#!/usr/bin/env bash
# yse - "Yay Search Exact" - search AUR and grep results
yay -Ss $1 | grep $1
