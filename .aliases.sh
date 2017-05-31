# vi ft=shell

# list size of top 11 directories
alias ducks='du -cksh *|sort -rh|head -11'

alias duu='du -sh --max-depth=1'

alias load='sar -u 2 1 | tail -n 1'


### EDITING
alias vz="vim ~/.zshrc"
alias vs="vim ~/.ssh/config"
alias vg="vim ./.git/config"
# Aliases
alias va="vim ~/.aliases.sh"
alias galias="alias | grep -i -e"

alias s="sudo su"

alias ai="sudo apt install"
alias as="sudo apt search"
alias au="sudo apt update"

# virtualenvwrapper workon
alias ww=workon

# shortcut for tmuxifier
alias tw="tmuxifier load-window"

alias gg="git gui"
alias recent-branches="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format=\"%(refname:short)\""
alias cd..="cd .."
alias cdh="cd ~"

# Smart ls alias (l=long, detailed, a=all including hidded, h=size human readable)
alias l="ls -lah"

# Make and change directory at once
alias mkcd="_(){ mkdir -p $1; cd $1; }; _"

# mount
alias mt="mount | column -t"
alias gmount="mount | grep -i -e"

# fast find filename
alias ff="find . -iname $1"

# find test
alias ft="find ./ -name 'test*.py' | grep"

# find in files (excluding .git directories)
alias fif="fgrep --exclude-dir={.git} --color=auto -rnw ./ -e"

# find in python files (excluding .git directories)
alias fipy1="fgrep --include=\"*.py\" --exclude-dir={.git} --color=always -rnwi ./ -e"

# find in python test files:
alias fipyt="fgrep --include=\"test*.py\" --exclude-dir={.git} --color=always -rnwi ./ -e"

alias count_loc="wc -l **/*.py"

### DJANGO
alias mp="./manage.py"
alias mpr="./manage.py runserver"
alias mpm="./manage.py migrate"
alias mpmkm="./manage.py makemigrations"
alias mpsm="./manage.py showmigrations"
alias mpsp="./manage.py shell_plus"



## Scripts section
fipy(){
	fgrep --include="*.py" --exclude-dir={.git} --color=always -rnwi ./ -e	$1 | less -R
}

fipy2(){
	fgrep --include="*.py" --exclude-dir={.git} --color=always -rnwi ./ -e $1 | grep $2
}
