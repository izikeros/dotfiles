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


# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# Correct spelling for commands
#setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

# Base PATH
#PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin

# --------------
# LS colors
# -------------
# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/
export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

# --------------
# zsh plugins
# --------------
export INC=$HOME/.zgen

R=$INC/zsh-users
source $R/zsh-completions-master/zsh-completions.plugin.zsh
source $R/zsh-autosuggestions-master/zsh-autosuggestions.plugin.zsh
#If zsh-syntax-highlighting is bundled after zsh-history-substring-search,
#they break, so get the order right.
source $R/zsh-syntax-highlighting-master/zsh-syntax-highlighting.zsh
source $R/zsh-history-substring-search-master/zsh-history-substring-search.zsh
# Load more completion files for zsh from the zsh-lovers github repo
#source $R/zsh-completions-master src

R=$INC/RobSis
# Very cool plugin that generates zsh completion functions for commands
    # if they have getopt-style help text. It doesn't generate them on the fly,
        # you'll have to explicitly generate a completion, but it's still quite cool.
#source $R/zsh-completion-generator-master/zsh-completion-generator.plugin.zsh

# Set keystrokes for substring searching
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

R=$INC/unixorn
  # Add my collection of miscellaneous utility functions.
  #zgen load unixorn/jpb.zshplugin

  # Colorize the things if you have grc installed. Well, some of the
  # things, anyway.
  #zgen load unixorn/warhol.plugin.zsh
  # Add my collection of git helper scripts
source $R/git-extra-commands-master/git-extra-commands.plugin.zsh

  # Add my bitbucket git helpers plugin
  #zgen load unixorn/bitbucket-git-helpers.plugin.zsh

  # A collection of scripts that might be useful to sysadmins
#  zgen load skx/sysadmin-util

# Adds aliases to open your current repo & branch on github.
#zgen load peterhurford/git-it-on.zsh

  # Tom Limoncelli's tooling for storing private information (keys, etc)
  # in a repository securely by encrypting them with gnupg
  #zgen load StackExchange/blackbox

  # Load some oh-my-zsh plugins
R=$INC/robbyrussell/oh-my-zsh-master/plugins
#  zgen oh-my-zsh plugins/pip
#  zgen oh-my-zsh plugins/sudo
#  zgen oh-my-zsh plugins/aws
#  zgen oh-my-zsh plugins/chruby
#  zgen oh-my-zsh plugins/colored-man-pages
source $R/git/git.plugin.zsh
  #zgen oh-my-zsh plugins/github
  #zgen oh-my-zsh plugins/python
  #zgen oh-my-zsh plugins/rsync
  #zgen oh-my-zsh plugins/screen
  #zgen oh-my-zsh plugins/vagrant

#  zgen load chrissicool/zsh-256color


# Docker completion
#  zgen load srijanshetty/docker-zsh

# Load me last
GENCOMPL_FPATH=$HOME/.zsh/complete



  # Add Fish-like autosuggestions to your ZSH
#  zgen load zsh-users/zsh-autosuggestions

  # k is a zsh script / plugin to make directory listings more readable,
  # adding a bit of color and some git status information on files and directories
#  zgen load supercrabtree/k

  # Bullet train prompt setup
  #zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
#  zgen oh-my-zsh themes/strug

# -------


# start zgen
#if [ -f ~/.zgen-setup ]; then
#  source ~/.zgen-setup
#fi
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

# If not running interactively return (??)
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

#-----------------------
# Powerlevel 9k
#-----------------------
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

export POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Limit to the last two folders
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# Left, right prompt segments
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws)

export POWERLEVEL9K_DIR_SHOW_WRITABLE=true
# default user (for this user at localhost context is not displayed)
export DEFAULT_USER=izik

export POWERLEVEL9K_DIR_HOME_FOREGROUND='blue'
export POWERLEVEL9K_DIR_HOME_BACKGROUND=default
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='blue'
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=default
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='blue'
export POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=default

# Advanced `vcs` color customization
export POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
export POWERLEVEL9K_VCS_CLEAN_BACKGROUND=dafault
export POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
export POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=default
export POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
export POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=default
#----------------
# dedupe path
#---------------

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
# (!!!) Note: takes quite long. Check if deduplications are needed
#dedupe_path

#zprof # end of profiling

# perform check of shell script
#shellcheck -x ~/.zshrc

