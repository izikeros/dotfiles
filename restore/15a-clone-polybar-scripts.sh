#!/bin/bash

PTH=$HOME/polybar-scripts/

git clone https://github.com/x70b1/polybar-scripts.git "$PTH"

echo "Changing mode of all .sh files to executable"
find "$PTH" -type f -name "*.sh" -exec chmod +x \{\} \;

