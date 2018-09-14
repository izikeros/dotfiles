#!/bin/bash
# z can be replaced with fasd

# ======== install z
if [ ! -d ~/z ]; then
    git clone https://github.com/rupa/z ~/z
    echo "z cloned to ~/z"
    echo "-------- source z.sh for bash and zsh -----------"
	PTH="$HOME/z/z.sh"
	CMD=" [ -f $PTH ] && source $PTH"

	grep -q "$PTH" $HOME/.zshrc && echo "z already sourced in ~/.zshrc" || echo $CMD >> $HOME/.zshrc #; echo "aliases added to ~/.zshrc"
	grep -q "$PTH" $HOME/.bashrc && echo "z already sourced in ~/.bashrc" || echo $CMD >> $HOME/.bashrc #; echo "aliases added to ~/.bashrc"
	echo "done"
else
    echo "z directory already exist, skipping cloning"
fi
echo