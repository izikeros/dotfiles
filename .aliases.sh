# vi ft=shell

#--------------------------------------------
# FILESYSTEM - DIRECTORY SIZE, LISTING
#--------------------------------------------
# list size of top 11 directories
alias ducks='du -cksh *|sort -rh|head -11'

# list directory size in current dir
alias duu='du -sh --max-depth=1'

alias df="pydf"

# display CPU load (requires sar installed)
alias load='sar -u 2 1 | tail -n 1'

# Smart ls alias (l=long, detailed, a=all including hidded, h=size human readable)
alias l="ls -lah"

#--------------------------------------------
# QUICK CHANGE DIRECTORY
#--------------------------------------------
alias cd..="cd .."
alias h="cd $HOME"
alias cdh="cd $HOME"
alias awdir="cd $HOME/.config/awesome"

#--------------------------------------------
# EDIT ACTIONS
#--------------------------------------------
alias v="vim"

# notes
alias vn="vim $HOME/notes/"
alias wiki="vim $HOME/Dropbox/wiki/index.md"
alias wt="vim ~/notes/wilabs_today.md"
alias td="vim $HOME/notes/TODO.md"

alias vz="vim $HOME/.zshrc"
alias vs="vim $HOME/.ssh/config"
alias vg="vim $HOME/.gitconfig"
alias vv="vim $HOME/.vimrc"
alias va="vim $HOME/dotfiles/.aliases.sh"
#alias vf="vim $HOME/.config/fish/config.fish"
alias vd="vim $HOME/dotfiles"
#alias cfg-awesome="vim $HOME/.config/awesome/rc.lua"
alias vx="vim $HOME/dotfiles/.xbindkeysrc"
alias vkeys="grep -e 'map' $HOME/dotfiles/.vimrc"

#--------------------------------------------
# MEATA-ALIAS
#--------------------------------------------
alias galias="alias | grep -i -e"
# TODO: add alias

#--------------------------------------------
# APT, APTITUDE, SUDO ACTIONS
#--------------------------------------------
alias s="sudo su"

alias ai="sudo apt install"

# search pattern only in package names
alias asn="apt-cache --names-only search"

alias as="apt-cache search"
alias au="sudo apt update"

# mount
alias mt="mount | column -t"
alias gmount="mount | grep -i -e"

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

#--------------------------------------------
# PYTHON, SOFTWARE PROJECT
#-------------------------------------------
# provide pep8 violation statisctics for current directory (.)
alias pep8-stats="pep8 --statistics -qq . | sort -k 1 -n -r"
alias nb="jupyter-notebook --notebook-dir $HOME/src"

# count lines of code
alias count_loc="wc -l **/*.py"

# test statistics
alias num_test_files="find ./ -name \"test*\" | wc -l"
alias num_test_cases="ag \"class Test\" | wc -l"
alias num_tests="ag \"def test_\" | wc -l"
alias num_assertions="ag \"self.assert|ok_|eq_\" | wc -l"

#-------------------------------------------
# DJANGO, MANAGE.PY
#--------------------------------------------
alias mp="./manage.py"
alias mpr="./manage.py runserver"
alias mpm="./manage.py migrate"
alias mpmkm="./manage.py makemigrations"
alias mpsm="./manage.py showmigrations"
alias mpsp="./manage.py shell_plus"
# virtualenvwrapper workon
alias ww=workon

#--------------------------------------------
# DOCKER (compose)
#-------------------------------------------
alias dcf="docker-compose -f dev-compose.yml"
alias dl='docker ps -lq'
alias dll='docker_fit ps -l'
alias dps='docker_fit ps -a'
alias docker-clean-exited-containers='docker ps -aqf status=exited | xargs -n1 docker rm'

#--------------------------------------------
# OTHER
#--------------------------------------------
alias wilabsvpn_up="nmcli connection up \"wilabs (openvpn)\""
alias hnfav="firefox https://news.ycombinator.com/favorites\\?id\=izik"
# shortcut for tmuxifier
alias tw="tmuxifier load-window"


# grep no comments
alias catnc="egrep -v \"^\s*(#|\$)\""
alias grepnc1="egrep -v \"^\s*(#|$)\""
alias kr="killall Ryver"

# find all git repositories in current directory excluding vim files (usually:
# vim plugins)
alias find-git-repos="find . -name \".git\" -type d | sed s/\.git//g | grep -v '.vim/'"
# TODO: check all git repos if they can be updated if so, ask one by one if update

# backup
alias firma-backup="restic -r $HOME/Dropbox/restic-firma backup $HOME/firma"
alias firma-snapshots="restic -r $HOME/Dropbox/restic-firma snapshots"
alias brightness="xrandr --output LVDS-1 --brightness $1"
alias sz="source ~/.zshrc"
alias hawk="echo awk -F\':\' \'{print \$\2}\'"
