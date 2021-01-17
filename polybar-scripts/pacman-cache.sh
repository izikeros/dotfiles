#!/usr/bin/env bash
cache=$(du -sh /var/cache/pacman/pkg/ | awk '{print $1}')
echo "C: $cache"
