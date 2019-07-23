#!/bin/bash

#
# very basic packages that should be installed on any system server or desktop
#

set -e

./pkg-from-the-list.sh ./pkg/basic.txt

echo "### Basic packages installed"