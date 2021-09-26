#!/usr/bin/env bash

# disable manager
sed "/qts-console-mgmt/s/^/#/" -i /etc/profile

# add entware and container station binaries to PATH

PTH="PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:\
/usr/local/bin:/opt/bin:/opt/sbin:\
/share/CACHEDEV1_DATA/.qpkg/container-station/bin"
 
echo $PTH >> /etc/profile
echo $PTH >> ~/.bashrc