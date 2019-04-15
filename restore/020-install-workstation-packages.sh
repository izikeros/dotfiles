#!/bin/bash

#
# extended list of packages dedicated to desktop workstation
#

set -e
./pkg-from-the-list.sh ./pkg/ext.txt

echo "### Workstation packages installed"
