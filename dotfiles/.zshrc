#!/bin/zsh
# shellcheck shell=bash
#zmodload zsh/zprof # if using profiler remember to uncomment zprof in the end of file

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
        zrecompile -p "$f" && command rm -f "$f".zwc.old
    done
    source "${ZDOTDIR:-$HOME}"/.zshrc
}
[[ ! -e ${ZDOTDIR:-$HOME}/.zshrc.zwc ]] && zsrc &>/dev/null

# enable mv command from zsh (e.g. for rename with pattern)
autoload -U zmv

# Enable auto-suggestions (requires zsh-autosuggestions plugin)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=gray'
plugins=(zsh-autosuggestions)
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable syntax highlighting (requires zsh-syntax-highlighting plugin)
plugins=(zsh-syntax-highlighting)
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Consolidate PATH modification
PATH=(
  /usr/local/bin
  /usr/local/sbin
  /sbin
  /usr/sbin
  /bin
  /usr/bin
  $HOME/bin
  $HOME/.zgen/zdharma/zsh-diff-so-fancy-master/bin
  $HOME/.local/bin
)
export PATH


# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# turn off the infernal correctall for filenames
unsetopt correctall

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

autoload -Uz compinit
compinit

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
if [ -d $HOME/.zsh-completions ]; then
  for completion in ~/.zsh-completions/*
  do
    source "$completion"
  done
fi

# Set env variables: non-sensitive and secrets
source ~/dotfiles/env_and_path.sh
[ -f $HOME/.homebrew_github_token ] && source ~/.homebrew_github_token
[ -f $HOME/.env_secret ] && source ~/.env_secret

[ -d ~/gocode ] && export GOPATH=~/gocode

# The "command not found" hook
# requires package database created by package pkgfile
# $ pacman -S pkgfile
# $ pkgfile -u
[ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && source /usr/share/doc/pkgfile/command-not-found.zsh

# Broot - file manager
[ -f "$HOME/.config/broot/launcher/bash/br" ] && source "$HOME/.config/broot/launcher/bash/br"

# fzf - fuzzy find in history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd - fast cd
if [ "$(command -v fasd)" ]; then
    eval "$(fasd --init auto)"
	unalias s
fi

"$HOME/scripts/my_scripts/runonce.sh" "$HOME/scripts/my_scripts/runonce-all.sh"

# --------------
# LS colors
# -------------
# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/
export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
if [ "$(command -v dircolors)" ]; then
    eval "$( dircolors -b "$HOME/.dircolors" )"
fi

# temporal hack to ensure that my aliases has priority

source ~/.zsh_aliases
source ~/.zsh_functions
source ~/.zsh_functions

# -------------
# powerlevel10k
# -------------
source "$HOME/.powerlevel9k-default-user"
source $HOME/.zgen/romkatv/powerlevel10k-master/powerlevel10k.zsh-theme
# mode: 'portable' - use only ascii characters in the prompt. Try 'fancy'.
export PURE_POWER_MODE=portable

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
# Left, right prompt segments
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh virtualenv dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws) # dropbox, add custom_git_user_email

# Note: deduplication takes quite long. Check if deduplications are needed (usually not)
#dedupe_path

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
[ -d "$HOME/.gem/ruby/2.7.0/bin" ] && export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
[ -d "$HOME/.nimble/bin" ] && export PATH=$PATH:$HOME/.nimble/bin
[ -d "$HOME/.local/bin" ] && export PATH=$PATH:$HOME/.local/bin
[ -d "$HOME/scripts/runonce-scripts" ] && export PATH=$PATH:$HOME/scripts/runonce-scripts
[ -d "$HOME/.cargo/bin/" ] && export PATH=$PATH:$HOME/.cargo/bin
[ -d "/Applications/Docker.app/Contents/Resources/bin" ] && export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

# Add my github username as env variable for script that gets my starred projects
export GITHUB_USER=izikeros


[ -d "/usr/local/opt/coreutils/libexec/gnubin" ] && export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#zprof # end of profiling
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#export DOCKER_HOST=unix://$HOME/docker.sock
