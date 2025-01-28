#!/bin/zsh
# shellcheck shell=bash
# zmodload zsh/zprof # if using profiler remember to uncomment zprof in the end of file
# Optimizations:
# - use lazy loading (see pyenv, mamba)
# - Reduce number of plugins: Review your .zgen-setup file and remove any plugins you don't actively use.


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# not running interactively then bail
[[ $- != *i* ]] && return

# reload ~/.zshrc and compile to .zwc ...  ZDOTDIR see:
# https://wiki.archlinux.org/index.php/zsh#Making_Zsh_your_default_shell
function zsrc() {
    local cache=""
    [[ -n $ZSH_CACHE_DIR ]] && cache=$ZSH_CACHE_DIR || cache="${ZDOTDIR:-$HOME}/.cache"
    autoload -U compinit zrecompile
    compinit -d "$cache/zcomp-$HOST"
    for f in ${ZDOTDIR:-$HOME}/.zshrc "$cache/zcomp-$HOST"; do
        if zrecompile -p "$f"; then
            command rm -f "$f".zwc.old
        else
            echo "Error recompiling $f" >&2
        fi
    done
    source "${ZDOTDIR:-$HOME}"/.zshrc
}

# Use a timestamp check: Only recompile if the .zshrc file is newer than the compiled version:
if [[ ${ZDOTDIR:-$HOME}/.zshrc -nt ${ZDOTDIR:-$HOME}/.zshrc.zwc ]]; then
  [[ ! -e ${ZDOTDIR:-$HOME}/.zshrc.zwc ]] && zsrc &>/dev/null
fi


# enable mv command from zsh (e.g. for rename with pattern)
autoload -U zmv

# Set the initial PATH
PATH="/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin"

dir_path_additions=(
    "$HOME/bin"
    "$HOME/.zgen/zdharma/zsh-diff-so-fancy-master/bin"
    "$HOME/.local/bin"
    "$HOME/.gem/ruby/2.7.0/bin"
    "$HOME/.nimble/bin"
    "$HOME/.local/bin"
    "$HOME/scripts/runonce-scripts"
    "$HOME/.cargo/bin/"
    "/Applications/Docker.app/Contents/Resources/bin"
    "/usr/local/opt/coreutils/libexec/gnubin"
    "/usr/local/opt/ccache/libexec"
    "/Applications/PyCharm.app/Contents/MacOS"  # pycharm
    "/Applications/VLC.app/Contents/MacOS"  # VLC
    "/Applications/Double Commander.app/Contents/MacOS" # doublecmd
    "/Applications/calibre.app/Contents/MacOS" # calibre ebook-convert
    "/Applications/Sublime Merge.app/Contents/MacOS" # sublime_merge
)

for path_dir in "${dir_path_additions[@]}"; do
    if [ -d "$path_dir" ]; then
        PATH="$path_dir:$PATH"
    fi
done

# Add file to PATH
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Export the modified PATH
export PATH

# turn off the infernal correctall for filenames
unsetopt correctall

# Set keystrokes for substring searching
zmodload zsh/terminfo

# Load me last
GENCOMPL_FPATH=$HOME/.zsh/complete

# ------ COMPLETIONS --------------
# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# Speed up autocomplete, force prefix mapping
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

# Load any custom zsh completions we've installed
if [ -d $HOME/.zsh-completions ]; then
  for completion in ~/.zsh-completions/*
  do
    source "$completion"
  done
fi


# The -U means mark the function vcs_info for autoloading and suppress alias expansion.
# The -z means use zsh (rather than ksh) style. See also the functions command
autoload -Uz compinit
compinit

# Global Alias Expansion
#
# Automatically Expanding Global Aliases (Space key to expand)
# references: http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
# Currently defined to expand only capital letters
globalias() {
  if [[ $LBUFFER =~ '[A-Z]+$' ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
}
zle -N globalias
bindkey " " globalias                 # space key to expand globalalias
bindkey "^ " magic-space              # control-space to bypass completion
bindkey -M isearch " " magic-space    # normal space during searches

# Fix oh-my-zsh-bug: widgets can only be called when ZLE is active
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

# Set some options
# set -o to list all available options and their current setting
#
# Set some options and their descriptions:
setopt BANG_HIST                  # Allow ! style history substitution.
setopt HIST_FIND_NO_DUPS          # Do not record duplicated commands in the history list.
setopt histfindnodups             # Same as HIST_FIND_NO_DUPS, but using alternative name for compatibility.
setopt append_history             # Append new history lines (commands) to the history file instead of overwriting it.
setopt extended_history           # Save timestamps along with the history lines.
setopt hist_expire_dups_first     # Remove older entries before removing duplicates in the history list.
setopt hist_ignore_all_dups       # Remove all duplicates from the history list.
setopt hist_ignore_dups           # Remove duplicates from the history list, retaining only the latest occurrence of each command.
setopt hist_ignore_space          # Do not record commands that begin with a space character in the history list.
setopt hist_reduce_blanks         # Remove superfluous blank lines from the history list.
setopt hist_save_no_dups          # Save the history list without duplicates when the shell exits.
setopt hist_verify                # Allow a user to edit a history line before it is executed.
setopt incappendhistory           # Add the current command to the history list immediately after it is entered.
setopt sharehistory               # Append new history lines from multiple sessions to the same history file.
setopt share_history              # Same as sharehistory, but using alternative name for compatibility.
setopt noclobber                  # Prevent overwriting of existing files with the > and >| redirection operators.
setopt pushd_ignore_dups          # Do not add duplicate directories to the directory stack when using pushd.
setopt completealiases            # Enable alias expansion during completion.
setopt autocd                     # Automatically change to a directory without typing 'cd'.
setopt noclobber                  # Prevent overwriting of existing files with the > and >| redirection operators.
setopt pushd_ignore_dups          # Do not add duplicate directories to the directory stack when using pushd.


# Keep a ton of history.
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"


# ------------ Sourcing --------------
# Set env variables: non-sensitive and secrets
source ~/dotfiles/env_and_path.sh
[ -f $HOME/.homebrew_github_token ] && source ~/.homebrew_github_token
[ -f $HOME/.env_secret ] && source ~/.env_secret
[ -d ~/gocode ] && export GOPATH=~/gocode

# The "command not found" hook
# requires package database created by package pkgfile
# $ pacman -S pkgfile
# $ pkgfile -u
#[ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && source /usr/share/doc/pkgfile/command-not-found.zsh

# fzf - fuzzy find in history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd - fast cd
if [ "$(command -v fasd)" ]; then
    eval "$(fasd --init auto)"
	unalias s
fi

# autojump
#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# my runonce scripts
#"$HOME/scripts/my_scripts/runonce.sh" "$HOME/scripts/my_scripts/runonce-all.sh"

# --------------
# LS and LESS colors
# -------------
# Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/
export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
if [ "$(command -v dircolors)" ]; then
    eval "$( dircolors -b "$HOME/.dircolors" )"
fi

# colors in less (default PAGER in Arch)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export TERM="xterm-256color"

# temporal hack to ensure that my aliases has priority over oh-my-zsh plugins
source ~/.zsh_aliases
source ~/.zsh_functions

# -------------
# powerlevel10k
# -------------
source "$HOME/.powerlevel9k-default-user"
source $HOME/.zgen/romkatv/powerlevel10k-master/powerlevel10k.zsh-theme
# mode: 'portable' - use only ascii characters in the prompt. Try 'fancy'.
export PURE_POWER_MODE=fancy

#source $HOME/.purepower # outdated
# Conditional load of Powerline10k
if [ -f "$HOME/.p10k.zsh" ]; then
    source "$HOME/.p10k.zsh"
fi
# virtualenv, conda
export POWERLEVEL9K_VIRTUALENV_FOREGROUND='green'
export POWERLEVEL9K_VIRTUALENV_BACKGROUND=none
export POWERLEVEL9K_CONDA_FOREGROUND='green'
export POWERLEVEL9K_CONDA_BACKGROUND=none
export POWERLEVEL9K_SHOW_RULER=false
export POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
export POWERLEVEL9K_SHOW_CHANGESET=true # git hash
# # Left, right prompt segments
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh virtualenv dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws) # dropbox, add custom_git_user_email

# -------------
# Misc
# -------------

# Add my GitHub username as env variable for script that gets my starred projects
export GITHUB_USER=izikeros

# Note: deduplication takes quite long. Check if deduplications are needed (usually not)
#dedupe_path

# Lazy load pyenv
pyenv() {
  unfunction pyenv
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(command pyenv init -)"
  fi
  pyenv "$@"
}

# Add other pyenv-related commands that should trigger initialization
pyenv-virtualenv() {
  unfunction pyenv-virtualenv
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(command pyenv init -)"
    eval "$(command pyenv virtualenv-init -)"
  fi
  pyenv-virtualenv "$@"
}

#export DOCKER_HOST=unix://$HOME/docker.sock

# # ----- Lazy load mamba
# # Set up mamba environment variables
# export MAMBA_EXE='/usr/local/bin/micromamba'
# export MAMBA_ROOT_PREFIX="$HOME/projects/ext/verba/..."

# # Initialize mamba once
# if [ -x "$MAMBA_EXE" ]; then
#   __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
#   if [ $? -eq 0 ]; then
#     eval "$__mamba_setup"
#   else
#     alias micromamba="$MAMBA_EXE"  # Fallback alias if setup fails
#   fi
#   unset __mamba_setup
# else
#   echo "Warning: Mamba executable not found at $MAMBA_EXE" >&2
# fi

# # Define lazy-loading function for mamba
# mamba() {
#   unfunction mamba  # Avoid recursion
#   $MAMBA_EXE "$@"
# }

# # Ensure micromamba calls mamba
# micromamba() {
#   mamba "$@"
# }

# # ----- end of mamba

# Source Cargo environment
. "$HOME/.cargo/env"

# Initialize direnv
eval "$(direnv hook zsh)"

# Source broot launcher
source "$HOME/.config/broot/launcher/bash/br"

# Long running processes should return time after they complete. Specified
# in seconds.
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit load zdharma-continuum/history-search-multi-word
# zinit load zsh-users/zsh-history-substring-search
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
# git - provides aliases (gl, gcb, ...) and functions (gbda - Deletes all merged branches,...)
#   See: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
zinit snippet OMZ::plugins/git
# replace unwanted alias
alias gg="git gui"

# zinit snippet OMZ::plugins/docker
zinit light djui/alias-tips

### End of Zinit's installer chunk
# Uncomment the following line to enable zsh profiling
# zprof # end of profiling
