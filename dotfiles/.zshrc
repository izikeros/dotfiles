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
export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

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


# temporal hack to ensure that my aliases has priority
source ~/.zsh_aliases
source ~/.zsh_functions

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
source /usr/bin/virtualenvwrapper.sh

if [[ -d ~/gocode ]]; then
  export GOPATH=~/gocode
fi

# The "command not found" hook
# requires package database created by package pkgfile
# $ pacman -S pkgfile
# $ pkgfile -u
source /usr/share/doc/pkgfile/command-not-found.zsh

# fzf - fuzzy find in history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd - fast cd
eval "$(fasd --init auto)"
unalias s

# fuck - correct last command
# eval "$(thefuck --alias)"

~/dotfiles/scripts/runonce.sh neofetch
~/dotfiles/scripts/runonce.sh ~/dotfiles/scripts/runonce-all.sh

#-----------------------
# Powerlevel 9k
#-----------------------
BG_COL='235'

export POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Limit to the last two folders
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

#
export POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

# Change vcs settings
export POWERLEVEL9K_STATUS_VERBOSE=true
export POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
export POWERLEVEL9K_SHOW_CHANGESET=true

# Left, right prompt segments
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda virtualenv context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws)

export POWERLEVEL9K_DIR_SHOW_WRITABLE=true
# default user (for this user at localhost context is not displayed)
export DEFAULT_USER=izik

export POWERLEVEL9K_DIR_HOME_FOREGROUND='blue'
export POWERLEVEL9K_DIR_HOME_BACKGROUND=$BG_COL
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='blue'
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$BG_COL
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='blue'
export POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$BG_COL

# Advanced `vcs` color customization
export POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green' # green
export POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$BG_COL
export POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
export POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$BG_COL
export POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
export POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$BG_COL


##-----Icon Set (copied from: https://github.com/black7375/BlaCk-Void-Zsh)
#get_icon_names
POWERLEVEL9K_ANDROID_ICON=$'\uF17B '              #   or  '\uE70E'  
POWERLEVEL9K_APPLE_ICON=$'\uF179 '                # 
POWERLEVEL9K_AWS_ICON=$'\uF1B3 '                  #  or  '\uF270 ' 
POWERLEVEL9K_AWS_EB_ICON=$'\uF1BD  '              #   or  '\uE7AD'  
POWERLEVEL9K_BACKGROUND_JOBS_ICON=$'\uF013 '      # 
POWERLEVEL9K_BATTERY_ICON=$'\uF241 '              #  or  '\uF240 ' 
POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\u21B5'       # ↵
POWERLEVEL9K_DATE_ICON=$'\uF073 '                 # 
POWERLEVEL9K_DISK_ICON=$'\uF0A0 '                 # 
POWERLEVEL9K_DROPBOX_ICON=$'\UF16B'               # 
#POWERLEVEL9K_ETC_ICON=$'\uF013'                   # 
POWERLEVEL9K_EXECUTION_TIME_ICON="Due"            #    or  '\uF252 ' 
POWERLEVEL9K_FAIL_ICON=$'\u2718'                  # ✘  or  '\uF00D' 
#POWERLEVEL9K_FOLDER_ICON=$'\uF07B '               #   or  '\uF115' 
POWERLEVEL9K_FREEBSD_ICON=$'\uF30C '              # 
POWERLEVEL9K_GO_ICON=$'\uE724'                    #  or  '\uE626' 
#POWERLEVEL9K_HOME_ICON=$'\uF015'                  # 
#POWERLEVEL9K_HOME_SUB_ICON=$'\uF07C'              # 
POWERLEVEL9K_JAVA_ICON=$'\U2615'                  # ☕︎
POWERLEVEL9K_KUBERNETES_ICON=$'\U2388'            # ⎈
POWERLEVEL9K_LARAVEL_ICON=$'\uE73f '              # 
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0'     # 
POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=' '       #   or   '\uF105'  or '\uF12D' 
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$' \uE0B1' # 
POWERLEVEL9K_LINUX_ICON=$'\uF17C '                # 
POWERLEVEL9K_LINUX_ARCH_ICON=$'\uF300'            # 
POWERLEVEL9K_LINUX_CENTOS_ICON=$'\uF304'          # 
POWERLEVEL9K_LINUX_COREOS_ICON=$'\uF305'          # 
POWERLEVEL9K_LINUX_DEBIAN_ICON=$'\uF306'          # 
POWERLEVEL9K_LINUX_ELEMENTARY_ICON=$'\uF309'      # 
POWERLEVEL9K_LINUX_FEDORA_ICON=$'\uF30A'          # 
POWERLEVEL9K_LINUX_GENTOO_ICON=$'\uF30D'          # 
POWERLEVEL9K_LINUX_MAGEIA_ICON=$'\uF310'          # 
POWERLEVEL9K_LINUX_MINT_ICON=$'\uF30E'            # 
POWERLEVEL9K_LINUX_NIXOS_ICON=$'\uF313'           # 
POWERLEVEL9K_LINUX_MANJARO_ICON=$'\uF312'         # 
POWERLEVEL9K_LINUX_DEVUAN_ICON=$'\uF307'          # 
POWERLEVEL9K_LINUX_ALPINE_ICON=$'\uF300'          # 
POWERLEVEL9K_LINUX_AOSC_ICON=$'\uF301'            # 
POWERLEVEL9K_LINUX_OPENSUSE_ICON=$'\uF314'        # 
POWERLEVEL9K_LINUX_SABAYON_ICON=$'\uF317'         # 
POWERLEVEL9K_LINUX_SLACKWARE_ICON=$'\uF319'       # 
POWERLEVEL9K_LINUX_UBUNTU_ICON=$'\uF31B'          # 
POWERLEVEL9K_LOAD_ICON=$'\uF524 '                 #  or L           or $'\uF140 '  or '\uF080 ' 
POWERLEVEL9K_LOCK_ICON=$'\uF023'                  #  or '\uE0A2' 
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"    #   or '\u256D'$'\U2500' ╭─
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "    #   or '\u251C'$'\U2500' ├─ or '\u2570'$'\U2500 '  ╰─
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='\u251C'$'\U2500' # ├─
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX='\u251C'$'\U2500'  # ├─
POWERLEVEL9K_NETWORK_ICON=$'\uF012 '              #  or $'\uF1fe '  or '\uF1EB' 
POWERLEVEL9K_NODE_ICON='\uE617 '                  #  or'\uE24F' ⬢
POWERLEVEL9K_OK_ICON=$'\u2714'                    # ✔ or $'\uF00c ' 
POWERLEVEL9K_PUBLIC_IP_ICON=$'\uF080 '            #  or $'\uF469'  or '\UF0AC' 
POWERLEVEL9K_PYTHON_ICON=$'\uF81F'                #  or '\uE73C ' # 
POWERLEVEL9K_RAM_ICON=$'\uF2db '                  #  or $'\uF0e4 ' 
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B2'    # 
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\uE0B3' # 
POWERLEVEL9K_ROOT_ICON="\uF0e7 Root"              #   or \uF292   or '\uE614 ' 
POWERLEVEL9K_RUBY_ICON=$'\uF219 '                 #  or '\uE791'  or $'\uE739' 
POWERLEVEL9K_RUST_ICON=$'\uE7a8'                  # 
POWERLEVEL9K_SERVER_ICON=$'\uF233 '               #  or '\uF473'  or '\uF0AE ' 
POWERLEVEL9K_SSH_ICON="(ssh)"                     #    or 'uf120'  or '\uE795'  or '\uF489'  # 
POWERLEVEL9K_SUDO_ICON=$'\uF09C'                  # 
POWERLEVEL9K_SUNOS_ICON=$'\uF185 '                # 
POWERLEVEL9K_SWAP_ICON=$'\uF464'                  #  or '\uF0C7 '  or '\uF109 ' 
POWERLEVEL9K_SWIFT_ICON=$'\uE755'                 # 
POWERLEVEL9K_SYMFONY_ICON=$'\uE757'               # 
POWERLEVEL9K_TEST_ICON=$'\uE29A '                 #  or '\uF188' 
POWERLEVEL9K_TIME_ICON=$'\uF017 '                 # 
POWERLEVEL9K_TODO_ICON=$'\uF046 '                 #  or '\uF133' 
POWERLEVEL9K_VCS_BOOKMARK_ICON=$'\uF461 '         #  or '\uF02E'  or '\uF097'  or '\uF08D'  or $'\uF223'  or ☿
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126 '           #  or '\uE702'  or 
POWERLEVEL9K_VCS_COMMIT_ICON="-o-"                #   or '\uE729' 
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=$'\uF171 '    #  or '\uF172 '  or '\uE703' 
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF113 '       #  or '\uF09B '  or '\uF092 ' 
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=$'\uF296 '       # 
POWERLEVEL9K_VCS_GIT_ICON=$'\uF1D3 '              #  or '\uF1D2' 
POWERLEVEL9K_VCS_HG_ICON=$'\uF223 '               #  or 
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uF063'  #  or '\uF01a'  or '\uF0AB'  or '\ud727'  or '\u2193' ↓
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uF062'  #  or '\uF01b'  or '\uF0AA'  or '\uE726'  or '\u2191' ↑
POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=$'\uF061 '    #  or '\uF18e'  or '\uF0A9'  or '\uE725'  or → or '\uE728 ' 
POWERLEVEL9K_VCS_STAGED_ICON=$'\uF067'            # ✚ or '\uF055'  or '\uF0FE' 
POWERLEVEL9K_VCS_STASH_ICON=$'\uF01C'             #  or '\uF192'  or ⍟
POWERLEVEL9K_VCS_SVN_ICON=$'\uE72D '              #  or'\uE268' 
POWERLEVEL9K_VCS_TAG_ICON=$'\uF02c '              #  or '\uF02B ' 
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\u25CF'          # ● or '\uF111'  or '\uF06A'  or '\uF12A'  or '\uF071' 
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uF128'         #  or '\uF059'  '\uF29C'  or '\u00B1' ?
POWERLEVEL9K_VPN_ICON="(vpn)"
POWERLEVEL9K_WINDOWS_ICON=$'\uF17a ' #  or '\uF17A' 



# Note: deduplication takes quite long. Check if deduplications are needed (usually not)
#dedupe_path

#zprof # end of profiling

# perform check of shell script
#shellcheck -x ~/.zshrc
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
