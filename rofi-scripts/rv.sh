#!/usr/bin/env bash

# Use rofi to list virtualenvs and print activation command (that needs to be manually copy-pasted)

venvs=$(find ~/.virtualenvs/ -maxdepth 1 -type d | tail -n +2)
echo "$venvs" | rofi -dmenu -p "Choose venv to activate:" -a 0 -no-custom | xargs -I{} sh -c "echo source {}/bin/activate"
#echo "$venvs" | rofi -dmenu -p "Choose venv to activate:" -a 0 -no-custom | xargs -I{} sh -c '/bin/bash -c "source {}/bin/activate; exec /bin/bash -i"'