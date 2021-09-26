#!/usr/bin/env bash
sed -i '/<b>/,/<\/b>/d' "$HOME/dotfiles/dotfiles/.config/doublecmd/doublecmd.xml"
