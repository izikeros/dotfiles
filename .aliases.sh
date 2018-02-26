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

# Smart ls alias (l=long, detailed, a=all including hidded, h=size human readable)
alias l="ls -lah"

# Find 10 largest files
alias top10files="find . -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}"

# Find 10 largest directories
alias top10dirs="find . -type d -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}"

#--------------------------------------------
# QUICK CHANGE DIRECTORY
#--------------------------------------------
alias cd..="cd .."
alias h="cd $HOME"
alias cdh="cd $HOME"

#--------------------------------------------
# EDIT ACTIONS
#--------------------------------------------
alias v="vim"

# notes
WIKI_HOME="$HOME/Dropbox/wiki"
alias t="vim DiaryNoteToday"
alias wiki="vim $WIKI_HOME/index.md"
alias wi="vim $WIKI_HOME/index.md"
alias td="vim $WIKI_HOME/TODO.md"
alias cdw="cd $WIKI_HOME"

# shortcuts to edit files (mostly config files)
alias vz="vim $HOME/.zshrc"
alias vs="vim $HOME/.ssh/config"
alias vg="vim $HOME/.gitconfig"
alias vv="vim $HOME/.vimrc"
alias va="vim $HOME/dotfiles/.aliases.sh"
alias vd="vim $HOME/dotfiles/"
alias vb="vim $HOME/dotfiles/bootstrap/"
alias vp="vim $HOME/dotfiles/bootstrap/packages/"
alias vx="vim $HOME/dotfiles/.xbindkeysrc"
alias ve="vim $HOME/env_vars.sh"
alias vkeys="grep --color=never -e 'map' $HOME/dotfiles/.vimrc"

#--------------------------------------------
# MEATA-ALIAS
#--------------------------------------------
alias galias="alias | grep --color=never -i -e"
# TODO: add alias from commandline (and append to this file)

#--------------------------------------------
# APT, APTITUDE, SUDO ACTIONS
#--------------------------------------------
alias s="sudo su"

# install package
alias ai="sudo apt install"
alias pi="sudo pacman -S"
alias yi="yaourt -S"

# search pattern only in package names
alias asn="apt-cache --names-only search"

alias as="apt-cache search"
alias pas="pacman -Ss"
alias ys="yaourt -Ss"

alias au="sudo apt update"

# remove (uninstall) package
alias prm="sudo pacman -Rns"

# mount
alias mt="mount | column -t"
alias gmount="mount | grep -i -e"
alias mountd="mount | grep /dev/sd | column -t"

alias purge='dpkg --list |grep "^rc" | cut -d " " -f 3 | xargs sudo dpkg --purge'

#alias largest-packages=dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n

#--------------------------------------------
# FIND (IN) FILES
#--------------------------------------------

# find file by filename
alias ff="find . -iname $1"

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
alias todo-extract="find ./ -name \"*.py\" | xargs grep -h \"TODO:\|FIXME:\" 2>/dev/null | sed \"s/^[ \s]*//g\" | sed \"s/TODO://\" | sed \"s/FIXME://\" | sed \"s/# # /# /g\""
#--------------------------------------------
# GIT
#--------------------------------------------
## git push with verbose ssh
alias gpv="GIT_SSH_COMMAND=\"ssh -v\" git push"

# open git gui
alias gg="git gui"

# open git gui for single commit
alias gg1="git gui citool"

# list branches you worked on recently
alias recent-branches="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format=\"%(refname:short)\""

alias git-repos="find ./ -name \"*.git\" -type d | sed 's/\.git$//'"

#--------------------------------------------
# PYTHON, SOFTWARE PROJECT
#-------------------------------------------
# provide pep8 violation statistics for current directory (.)
alias pep8-stats="pep8 --statistics -qq . | sort -k 1 -n -r"
alias nb="jupyter-notebook --notebook-dir $HOME/src"

# count lines of code
alias count_loc="wc -l **/*.py"

# test statistics
alias test-num-files="find ./ -name \"test*\" | wc -l"
alias test-num-cases="ag \"class Test\" | wc -l"
alias test-num="ag \"def test_\" | wc -l"
alias test-num-assertions="ag \"self.assert|ok_|eq_\" | wc -l"

# coloured cat for source code:
alias ccat=ccat.sh

# upgrade all pip packages (system or virt-env if in virt-env)
alias pip-upgrade='pip freeze local > ~/pip_before_upgrade.txt && sudo -h pip install pipdate && sudo -H pipdate'

#-------------------------------------------
# DJANGO, MANAGE.PY
#--------------------------------------------
alias mp="./manage.py"
alias mpr="./manage.py runserver"
alias mpm="./manage.py migrate"
alias mpmkm="./manage.py makemigrations"
alias mpsm="./manage.py showmigrations"
alias mpsp="./manage.py shell_plus"

#-------------------------------------------
# Activate virtualenvs
#-------------------------------------------
alias a-pelican="source ~/.virtualenvs/pelican/bin/activate"
alias a-ebadu="source ~/.virtualenvs/ebadu-d1.11/bin/activate"

#--------------------------------------------
# DOCKER (and docker-compose)
#-------------------------------------------
alias dcf="docker-compose -f dev-compose.yml"
alias dl='docker ps -lq'
alias dll='docker_fit ps -l'
alias dps='docker_fit ps -a'
alias docker-clean-exited-containers='docker ps -aqf status=exited | xargs -n1 docker rm'
alias docker-list-untagged-images='echo $(docker images | grep "<none>" | awk "{print \$3}")'
alias docker-remove-untagged-images='docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")'

#--------------------------------------------
# CALIBRE
#--------------------------------------------
alias c-it='calibre --with-library=/mnt/veracrypt3/books_it'
alias c-astro='calibre --with-library=/mnt/veracrypt3/books_astro'
alias c-life='calibre --with-library=/mnt/veracrypt3/books_life'

#--------------------------------------------
# OTHER
#--------------------------------------------
alias wilabsvpn_up="nmcli connection up \"wilabs (openvpn)\""

alias hnfav="firefox https://news.ycombinator.com/favorites\\?id\=izik"

alias cx="chmod +x"

# shortcut for tmuxifier
alias tw="tmuxifier load-window"

# launch jupyter-lab
alias jl="source $HOME/.venv/jl/bin/activate && jupyter lab"

# grep no comments
alias catnc="egrep -v \"^\s*(#|\$)\""
alias grepnc1="egrep -v \"^\s*(#|$)\""

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

# help on how to use awk to extract given column
alias hawk="echo awk -F\':\' \'{print \$\2}\'"
alias ytmp3="youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg"
alias yd=youtube-dl

# show 50 most used cli commands
alias history-top="history |  cut -c7- | sort  | uniq -c | sort -nr | head -n 50"

# remove comments from file
alias rm-comments="sed -e \"s/#.*$//gi\" -e \"/^$/d\""

# lsblk
# dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync

alias pacman="pacman --color=always"
alias update="sudo pacman -Syu --color=always"
alias windirstat="gdmap"
