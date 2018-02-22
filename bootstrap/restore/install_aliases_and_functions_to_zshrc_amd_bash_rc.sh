#!/bin/bash

echo "-------- install aliases & functions for bash and zsh -----------"
ALIAS_PTH=$HOME/dotfiles/.aliases.sh
FUNCT_PTH=$HOME/dotfiles/functions.sh
ALIAS_CMD="source $ALIAS_PTH"
FUNCT_CMD="source $FUNCT_PTH"

grep -q "$ALIAS_PTH" $HOME/.zshrc && echo "aliases already sourced in ~/.zshrc" || echo $ALIAS_CMD >> $HOME/.zshrc #; echo "aliases added to ~/.zshrc"
grep -q "$ALIAS_PTH" $HOME/.bashrc && echo "aliases already sourced in ~/.bashrc" || echo $ALIAS_CMD >> $HOME/.bashrc #; echo "aliases added to ~/.bashrc"

grep -q "$FUNCT_PTH" $HOME/.zshrc && echo "functions already sourced in ~/.zshrc" || echo $FUNCT_CMD >> $HOME/.zshrc #; echo "functions added to ~/.zshrc"
grep -q "$FUNCT_PTH" $HOME/.bashrc && echo "functions already sourced in ~/.bashrc" || echo $FUNCT_CMD >> $HOME/.bashrc #; echo "functions added to ~/.bashrc"
