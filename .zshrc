#!/bin/bash
#zmodload zsh/zprof

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# Correct spelling for commands
setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

# Base PATH
#PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin

# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/

export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

# start zgen
if [ -f ~/.zgen-setup ]; then
  source ~/.zgen-setup
fi
# end zgen

# temporal hack to ensure that my aliases has priority
source ~/.zsh_aliases
source ~/.zsh_functions

# set some history options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

# Share your history across all your terminal windows
setopt share_history
#setopt noclobber

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

# How often to check for an update. If you want to override this, the
# easiest way is to add a script fragment in ~/.zshrc.d that unsets
# QUICKSTART_KIT_REFRESH_IN_DAYS.
#QUICKSTART_KIT_REFRESH_IN_DAYS=7
unset QUICKSTART_KIT_REFRESH_IN_DAYS

# Expand aliases inline - see http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

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

# Make it easy to append your own customizations that override the above by
# loading all files from .zshrc.d directory
# mkdir -p ~/.zshrc.d

# if [ -n "$(/bin/ls ~/.zshrc.d)" ]; then
#   for dotfile in ~/.zshrc.d/*
#   do
#     if [ -r "${dotfile}" ]; then
#       source "${dotfile}"
#     fi
#   done
# fi
# Zshrc

# If not running interactively return
[[ $- != *i* ]] && return

export PATH=$HOME/bin:$PATH

setopt AUTO_CD BANG_HIST EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY SHARE_HISTORY

source /home/izik/dotfiles/env_and_path.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fasd --init auto)"
eval "$(thefuck --alias)"

~/dotfiles/scripts/runonce.sh neofetch
~/dotfiles/scripts/runonce.sh ~/dotfiles/scripts/check_if_repos_are_clean.sh

#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Limit to the last two folders
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# Left, right prompt segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv aws)

POWERLEVEL9K_DIR_SHOW_WRITABLE=true
# default user (for this user at localhost context is not displayed)
export DEFAULT_USER=izik

POWERLEVEL9K_DIR_HOME_FOREGROUND='blue'
POWERLEVEL9K_DIR_HOME_BACKGROUND=default
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=default
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=default

# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=dafault
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=default
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=default

# In case a plugin adds a redundant path entry, remove duplicate entries
# from PATH
#
# This snippet is from Mislav Marohnić <mislav.marohnic@gmail.com>'s
# dotfiles repo at https://github.com/mislav/dotfiles
dedupe_path() {
  typeset -a paths result
  paths=($path)

  while [[ ${#paths} -gt 0 ]]; do
    p="${paths[1]}"
    shift paths
    [[ -z ${paths[(r)$p]} ]] && result+="$p"
  done

  export PATH=${(j+:+)result}
}

dedupe_path

#zprof # end of profiling
