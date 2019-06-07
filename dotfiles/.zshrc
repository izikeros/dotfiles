#!/bin/bash
#zmodload zsh/zprof # if using profiler remember to uncomment zprof in the end of file

# # Zsh start up sequence:
#  1) /etc/zshenv   -> Always run for every zsh.   (login + interactive + other)
#  2)   ~/.zshenv   -> Usually run for every zsh.  (login + interactive + other)
#  3) /etc/zprofile -> Run for login shells.       (login)
#  4)   ~/.zprofile -> Run for login shells.       (login)
#  5) /etc/zshrc    -> Run for interactive shells. (login + interactive)
#  6)   ~/.zshrc    -> Run for interactive shells. (login + interactive)
#  7) /etc/zlogin   -> Run for login shells.       (login)
#  8)   ~/.zlogin   -> Run for login shells.       (login)
#

# not running interactively then bail
[[ $- != *i* ]] && return

# colors in less (default PAGER in Arch)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export TERM="xterm-256color"

# reload ~/.zshrc and compile to .zwc ...  ZDOTDIR see:
# https://wiki.archlinux.org/index.php/zsh#Making_Zsh_your_default_shell
function zsrc() {
    local cache=""
    [[ -n $ZSH_CACHE_DIR ]] && cache=$ZSH_CACHE_DIR || cache="${ZDOTDIR:-$HOME}/.cache"
    autoload -U compinit zrecompile
    compinit -d "$cache/zcomp-$HOST"
    for f in ${ZDOTDIR:-$HOME}/.zshrc "$cache/zcomp-$HOST"; do
        zrecompile -p $f && command rm -f $f.zwc.old
    done
    source ${ZDOTDIR:-$HOME}/.zshrc
}
[[ ! -e ${ZDOTDIR:-$HOME}/.zshrc.zwc ]] && zsrc &>/dev/null


# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# turn off the infernal correctall for filenames
unsetopt correctall

# --------------
# LS colors
# -------------
# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/
#export LSCOLORS='Exfxcxdxbxegedabagacad'
#export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

# Set keystrokes for substring searching
zmodload zsh/terminfo
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down

# Load me last
GENCOMPL_FPATH=$HOME/.zsh/complete

# start zgen
if [ -f ~/.zgen-setup ]; then
  source ~/.zgen-setup
fi
# end zgen


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


# Base PATH
PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin
export PATH=$HOME/bin:$PATH


# set -o to list all available options and their current setting
setopt BANG_HIST

setopt HIST_FIND_NO_DUPS
setopt histfindnodups
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt histignorealldups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt incappendhistory
setopt sharehistory
setopt share_history

# Correct spelling for commands
#setopt correct

setopt autocd
setopt completealiases

# Share your history across all your terminal windows
setopt noclobber

# set some more options
setopt pushd_ignore_dups
#setopt pushd_silent

# Keep a ton of history.
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Long running processes should return time after they complete. Specified
# in seconds.
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Expand aliases inline - see http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html

# Speed up autocomplete, force prefix mapping
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

# Load any custom zsh completions we've installed
if [ -d ~/.zsh-completions ]; then
  for completion in ~/.zsh-completions/*
  do
    source "$completion"
  done
fi

source ~/dotfiles/env_and_path.sh

# virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
	source /usr/bin/virtualenvwrapper.sh
fi

if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
	source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

if [[ -d ~/gocode ]]; then
  export GOPATH=~/gocode
fi

# The "command not found" hook
# requires package database created by package pkgfile
# $ pacman -S pkgfile
# $ pkgfile -u
if [ -f /usr/share/doc/pkgfile/command-not-found.zsh ]; then
	source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# fzf - fuzzy find in history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd - fast cd
if hash fasd 2>/dev/null; then
	eval "$(fasd --init auto)"
	unalias s
fi
# fuck - correct last command
# eval "$(thefuck --alias)"

~/dotfiles/scripts/runonce.sh neofetch
~/dotfiles/scripts/runonce.sh ~/dotfiles/scripts/runonce-all.sh

if [ -f ~/.powerlevel9k ]; then
	source ~/.powerlevel9k
fi

# --------------
# LS colors
# -------------
# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/
export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
if hash dircolors 2>/dev/null; then
    eval $( dircolors -b $HOME/.dircolors )
fi

# temporal hack to ensure that my aliases has priority
source ~/.zsh_aliases
source ~/.zsh_functions

# Note: deduplication takes quite long. Check if deduplications are needed (usually not)
#dedupe_path

#zprof # end of profiling

# perform check of shell script
#shellcheck -x ~/.zshrc
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
