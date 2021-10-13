#!/usr/bin/env bash
docker_dir=$(sudo du -sh /var/lib/docker | awk '{print $1}')
echo "D: $docker_dir"
