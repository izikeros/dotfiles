#!/bin/bash

function package_description(){
dsc=`apt-cache search ^$1$ | awk -F' - ' '{print $2}'`
echo $dsc
}

list=`comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)`
for pkg in $list
do
    dsc=$(package_description $pkg)
    printf "%-10s | %-100s \n" "$pkg" "$dsc"
#   echo $pkg $dsc
done
