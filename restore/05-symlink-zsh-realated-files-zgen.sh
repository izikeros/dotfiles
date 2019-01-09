#!/bin/bash

source ./helper_functions.sh

symlink_dotfile ./dotfiles/.zshrc_zgen_with_setup_script ~/.zsh_aliases
symlink_dotfile ./dotfiles/.zsh_aliases ~/.zsh_aliases
symlink_dotfile ./dotfiles/.zsh_functions ~/.zsh_functions
symlink_dotfile ./dotfiles/.zgen-setup ~/.zgen-setup