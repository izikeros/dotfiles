# vi ft=shell

#--------------------------------------------
# FILESYSTEM - DIRECTORY SIZE, LISTING
#--------------------------------------------
# list size of top 11 directories
alias ducks='du -cksh *|sort -rh|head -11'

# list directory size in current dir
alias duu='du -sh --max-depth=1'

# free/used space on devices
alias df="pydf"

# free/used space on disk devices
alias dfd="pydf | head -n 1; pydf | grep --colour=never /dev/sd"

# display CPU load (requires sar installed)
alias load='sar -u 2 1 | tail -n 1'

# Find 10 largest files
alias top10files="find . -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}"

# Find 10 largest directories
alias top10dirs="find . -type d -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}"

#--------------------------------------------
# LS
#--------------------------------------------
# Smart ls alias (l=long, detailed, a=all including hidded,
#   h=size human readable)
alias l="ls -lah"


#--------------------------------------------
# QUICK CHANGE DIRECTORY
#--------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."
alias h="cd $HOME"
alias cdh="cd $HOME"
alias cdr="cd $HOME/dotfiles/bootstrap/restore"

#--------------------------------------------
# EDIT ACTIONS
#--------------------------------------------
# Sublime
S="/usr/bin/subl3"
alias s="subl3"
# run atom without hardware accelleration
alias atom="atom --disable-gpu"
# run visual studio code without hardware acceleration
alias code="code --disable-gpu"

# notes
WIKI_HOME="$HOME/vimwiki"
#alias t="vim DiaryNoteToday"
#alias t="DATE=$(date +%Y-%m-%d) &&  vim $WIKI_HOME/diary/$DATE.md"
alias wiki="vim $WIKI_HOME/index.md"
alias wi="vim $WIKI_HOME/index.md"
alias td="vim $WIKI_HOME/TODO.md"
alias cdw="cd $WIKI_HOME"

# shortcuts to edit files (mostly config files)
alias vz="vim $HOME/.zshrc"
alias s-z="$S $HOME/.zshrc"
alias vzz="vim $HOME/.zshrc.d/zshrc_arch"
alias s-zz="$S $HOME/.zshrc.d/zshrc_arch"

alias vv="vim $HOME/.vimrc"
alias sv="$S $HOME/.vimrc"

alias va="vim $HOME/dotfiles/.aliases.sh"
alias sa="$S $HOME/dotfiles/.aliases.sh"

alias vs="vim $HOME/.ssh/config"
alias vg="vim $HOME/.gitconfig"

alias vd="vim $HOME/dotfiles/"
alias vb="vim $HOME/dotfiles/bootstrap/"
alias vp="vim $HOME/dotfiles/bootstrap/pkg/"
alias vext="vim $HOME/dotfiles/bootstrap/pkg/ext.txt"
alias vy="vim $HOME/dotfiles/bootstrap/pkg/yaourt_installs.sh"

alias vx="vim $HOME/dotfiles/.xbindkeysrc"
alias ve="vim $HOME/env_and_path.sh"
alias vkeys="grep --color=never -e 'map' $HOME/dotfiles/.vimrc"

#--------------------------------------------
# MEATA-ALIAS
#--------------------------------------------
alias galias="alias | grep --color=never -i -e"
# TODO: add alias from commandline (and append to this file)

#--------------------------------------------
# APT, APTITUDE, DPKG
#--------------------------------------------
#alias s="sudo su"

# install packages (Debian)
alias ai="sudo apt install"
# search pattern only in package names
alias asn="apt-cache --names-only search"
alias as="apt-cache search"
alias purge='dpkg --list |grep "^rc" | cut -d " " -f 3 | xargs sudo dpkg --purge'
alias au="sudo apt update"
#alias largest-packages=dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n

#-------------------------------------------
# PACMAN, YAOURT
#-------------------------------------------
alias pi="sudo pacman -S"
alias yi="yaourt -S"

alias pas="pacman -Ss"
alias ys="yaourt -Ss"

# remove (uninstall) package
alias prm="sudo pacman -Rns"

alias pacman="pacman --color=always"
alias update="sudo pacman -Syu --color=always"
alias u="sudo pacman -Syu --color=always"

#---------------------------------------------
# Mount
#---------------------------------------------
alias mt="mount | column -t"
alias gmount="mount | grep -i -e"
# list disks/partitions
alias mountd="mount | grep /dev/sd | column -t"

#--------------------------------------------
# FIND (IN) FILES
#--------------------------------------------
# find file by filename
alias ff="find . -iname $1"

# find files in current directory
alias ff-here="find . -maxdepth 1 -type f"

# find test function
alias ft="find ./ -name 'test*.py' | grep"

# find in files (excluding .git directories)
alias fif="fgrep --exclude-dir={.git} --color=auto -rnw ./ -e"

# find in python files (excluding .git directories)
alias fipy1="fgrep --include=\"*.py\" --exclude-dir={.git} --color=always -rnwi ./ -e"

# find in python test files (pyt - python tests)
alias fipyt="fgrep --include=\"test*.py\" --exclude-dir={.git} --color=always -rnwi ./ -e"

# find in python files excluding tests (pynt - python no tests)
alias fipynt="fgrep --include=\"*.py\" --exclude-dir={.git,tests} --color=always -rnwi ./ -e"

# find markdown files created today
alias mdtoday="find . -name \"*.md\" -mtime -1 -type f -print"

#alias todo-extract="find ./ | xargs grep -h \"TODO:\" | sed \"s/^[ \s]*//g\""
# extract TODO/FIXME from files in current directory (recursive) and print to
# stdout
alias todo-extract="find ./ -name \"*.py\" | xargs grep -h \"TODO:\|FIXME:\" 2>/dev/null | sed \"s/^[ \s]*//g\" | sed \"s/TODO://\" | sed \"s/FIXME://\" | sed \"s/# # /# /g\""

#--------------------------------------------
# GIT
#--------------------------------------------
# git push with verbose ssh (useful for troubleshooting)
alias gpv="GIT_SSH_COMMAND=\"ssh -v\" git push"

# open git gui
alias gg="git gui"

# open git gui for single commit
alias gg1="git gui citool"

# list branches you worked on recently
alias recent-branches="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format=\"%(refname:short)\""

# list git repos in current directory
alias git-repos="find ./ -name \"*.git\" -type d | sed 's/\.git$//'"

#--------------------------------------------
# PYTHON, SOFTWARE PROJECT
#-------------------------------------------
# provide pep8 violation statistics for current directory (.)
alias pep8-stats="pep8 --statistics -qq . | sort -k 1 -n -r"

# count lines of code
alias count_loc="wc -l **/*.py"

# test statistics
alias test-num-files="find ./ -name \"test*\" | wc -l"
alias test-num-cases="ag \"class Test\" | wc -l"
alias test-num="ag \"def test_\" | wc -l"
alias test-num-assertions="ag \"self.assert|ok_|eq_\" | wc -l"
alias test-integration-list="find . -type f -name \"test_integration*\" | xargs grep -H -A 1 \"def test\" | sed 's/def//' | sed 's/self//' | sed 's/://'"
# coloured cat for source code:
alias ccat=ccat.sh

# upgrade all pip packages (system or virt-env if in virt-env)
alias pip-upgrade='pip freeze local > ~/pip_before_upgrade.txt && sudo -h pip install pipdate && sudo -H pipdate'

alias nb="jupyter-notebook --notebook-dir $HOME/src"

#-------------------------------------------
# DJANGO, MANAGE.PY
#--------------------------------------------
alias mp="./manage.py"
alias mpr="./manage.py runserver"
alias mprp="./manage.py runserver_plus"
alias mpm="./manage.py migrate"
alias mpk="./manage.py makemigrations"
alias mps="./manage.py showmigrations"
alias mpsp="./manage.py shell_plus"

alias mptc='coverage run ./manage.py test --pattern="test_*.py"'
alias mpt='./manage.py test --pattern="test_*.py"'

#-------------------------------------------
# Activate virtualenvs (& launch app)
#-------------------------------------------
#alias a-pelican="source ~/.virtualenvs/pelican/bin/activate"
#alias a-ebadu="source ~/.virtualenvs/ebadu-d1.11/bin/activate"

# launch jupyter-lab
alias jl="source $HOME/.venv/jl/bin/activate && jupyter lab"

#--------------------------------------------
# DOCKER (and docker-compose)
#-------------------------------------------
alias dcf="docker-compose -f dev-compose.yml"
alias dl='docker ps -lq'
alias dll='docker_fit ps -l'
alias dps='docker_fit ps -a'
alias docker-clean-exited-containers='docker ps -aqf status=exited | xargs -n1 docker rm'
alias docker-list-untagged-images='echo $(docker images | grep "<none>" | awk "{print \$3}")'
alias docker-remove-untagged-images='docker rmi -f $(docker images -a| grep "<none>" | awk "{print \$3}")'

#--------------------------------------------
# CALIBRE & RECOLL
#--------------------------------------------
alias c-it='calibre --with-library=/mnt/veracrypt3/books_it'
alias r-it='recoll -c $HOME/.recoll_indexes/.recoll_it'
alias c-astro='calibre --with-library=/mnt/veracrypt3/books_astro'
alias r-astro='recoll -c $HOME/.recoll_indexes/.recoll_astro'
alias c-life='calibre --with-library=/mnt/veracrypt3/books_life'
alias r-life='recoll -c $HOME/.recoll_indexes/.recoll_life'

#---------------------------------------------
# HELP on comonly used sed, awk, perl commands
#---------------------------------------------
# help on how to use awk to extract given column
alias h-awk="echo awk -F\':\' \'{print \$\2}\'"
alias h-sed="man sed"
alias h-perl="man perl"

#--------------------------------------------
# OTHER
#--------------------------------------------
alias wilabsvpn_up="nmcli connection up \"wilabs (openvpn)\""

alias hnfav="firefox https://news.ycombinator.com/favorites\\?id\=izik"

alias cx="chmod +x"

# make all shell scripts in current directory executable
alias cxsh="chmod +x *.sh"

# shortcut for tmuxifier
alias tw="tmuxifier load-window"

#---------------------------------------------
# Comments removal
#---------------------------------------------
# grep no comments
alias catnc="egrep -v \"^\s*(#|\$)\""
alias grepnc1="egrep -v \"^\s*(#|$)\""

# remove comments from file and remove empty line after removing comment
alias rm-comments="sed -e \"s/#.*$//gi\" -e \"/^$/d\""

alias kr="killall Ryver"

# find all git repositories in current directory excluding vim files (usually:
# vim plugins)
alias find-git-repos="find . -name \".git\" -type d | sed s/\.git//g | grep -v '.vim/'"
# TODO: check all git repos if they can be updated if so, ask one by one if update

# backup
alias firma-backup="restic -r $HOME/Dropbox/restic-firma backup $HOME/bulk/firma"
alias firma-snapshots="restic -r $HOME/Dropbox/restic-firma snapshots"

alias brightness="xrandr --output LVDS-1 --brightness $1"
alias sz="source ~/.zshrc"

alias ytmp3="youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg"
alias yd=youtube-dl

# show 50 most used cli commands
alias history-top="history |  cut -c7- | sort  | uniq -c | sort -nr | head -n 50"
# see also: zsk_stats

# lsblk
# dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync

alias windirstat="gdmap"
alias boots="journalctl --list-boots"

## IP
# A couple of different external IP lookups depending on which is down.
alias external_ip="curl -s icanhazip.com"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Show laptop's IP addresses
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Strip color codes from commands that insist on spewing them so we can
# pipe them into files cleanly
alias stripcolors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'


# On the rare occasions I don't want to continue a download I can always
# delete the incomplete fragment explicitly. I usually just want to
# complete it.
alias wget="wget -c"

# Dump the last 20 history entries
alias zh="fc -l -d -D"

# replace https reference to ssh (to be used with my repos)
alias ssh-it="sed -i 's/url = https:\/\/github\.com\//url = github:/'"

# join two consecutive lines in one line
alias oneline="sed -rn 'N;s/\n/ /;p'"

#alias finde='find -L . -type d \( -path "*.git" -o -path "*.fzf*" -o -path "*/Documents" -o -path "*/Downloads" -o -path "*.cache" -o -path "*/Pictures" -o -path "*/.mozilla" -o -path "*.jg" \) -prune -o -print'
alias finde="find . ! -path '*/.venv*' ! -path '*/.fzf*' ! -path '*./bulk*' ! -path '*.cache*' ! -path '*.git/*' ! -path '*.mozilla*' ! -path '*.jd*' ! -path '*.zgen/*' ! -path '*.vim*' ! -path '*.zplug*'"
alias finde-files="find . -type f ! -path '*/.venv*' ! -path '*/.fzf*' ! -path '*./bulk*' ! -path '*.cache*' ! -path '*.git/*' ! -path '*.mozilla*' ! -path '*.jd*' ! -path '*.zgen/*' ! -path '*.vim*' ! -path '*.zplug*'"

#---------------------------------------------
#  blog
#---------------------------------------------

BLG="source ~/.virtualenvs/pelican-blog-H2eFmQ-s/bin/activate; cd ~/blog"
alias blog="$BLG"
alias pelican-run="$BLG; pelican content; cd docs; python -m pelican.server"
alias blog-push="cd ~/blog/docs; git add .; git ci -m \"update\"; gp"
alias list-boots="journalctl --list-boots"

alias pipup="pip install --upgrade pip"
