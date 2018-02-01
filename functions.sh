# vi ft=shell

## Functions
# find in python files
function fipy(){
	fgrep --include="*.py" --exclude-dir={.git} --color=always -rnwi ./ -e	$1 | less -R
}

# find in python files - grep using two keywords
function fipy2(){
	fgrep --include="*.py" --exclude-dir={.git} --color=always -rnwi ./ -e $1 | grep $2
}

# search only in package names starting with pattern
function asa(){
	aptitude search ^$1 | awk '{print $2}'
	}

# docker-related functions
# source: https://github.com/rhoit/my-config/blob/master/shell/shellrc.d/docker.sh
function dimg() {
    docker images $@ |
        sed "s/  \+/;/g" |
        column -s\; -t |
        sed "1s/.*/\x1B[1m&\x1B[m/"
}

function docker_fit() {
    # docker fit output
    docker $@ |
    sed '
        1s/ *NAMES$//g;
        s/ *[a-z]\+_[a-z]\+$//g;
        s/"\(.*\)"/\1/g;
        s/ seconds/s/g;
        s/ minutes/m/g;
        s/ hours/h/g;
        s/About a minute/1m/g;
        s/About an hour/1h/g;
        s/Exited (\([0-9]\+\)) \(.*\)ago/exit(\1)~\2/;
        s/->/→/g
        ' |
    sed "s/  \+/;/g" |
    column -s\; -t |
    sed "1s/.*/\x1B[1m&\x1B[m/"
}

function dlc() {
    # cache docker last container id DOCKER_CACHE
    1>&2 docker ps -l
    export DOCKER_CACHE=$(docker ps -lq)
}

function dlo() {
    if [[ -t 1 ]]; then
        while read data; do
            args+="$data"
        done
        docker logs $args
        return
    fi
    if [[ $DOCKER_CACHE != "" ]]; then
        docker logs $DOCKER_CACHE
        return
    fi
    docker logs $@
}
# /end of source

# remove dicker container using rofi
function drm() {
    echo "$(docker ps -a | rofi -threads 0 -width 100 -dmenu -i -p "locate:")" | awk {'print $1'} | xargs docker rm
}

# search onli in package names starting with pattern
function asa(){
    aptitude search ^$1 | awk '{print $2}'
    }

# create directory and move into it
function mkcd () {
  mkdir -p "$1"
  cd "$1"
}

function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.7z)       7z x $1       ;;
            *.Z)        uncompress $1 ;;
            *.bz2)      bunzip2 $1    ;;
            *.gz)       gunzip $1     ;;
            *.rar)      rar x $1      ;;
            *.tar)      tar xf $1     ;;
            *.tar.bz2)  tar xjf $1    ;;
            *.tar.gz)   tar xzf $1    ;;
            *.tar.xz)   tar xf $1     ;;
            *.tbz2)     tar xjf $1    ;;
            *.tgz)      tar xzf $1    ;;
            *.zip)      unzip $1      ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
