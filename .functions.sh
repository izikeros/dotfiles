# vi ft=shell

## Functions
# find in python files
fipy(){
	fgrep --include="*.py" --exclude-dir={.git} --color=always -rnwi ./ -e	$1 | less -R
}

# find in python files - grep using two keywords
fipy2(){
	fgrep --include="*.py" --exclude-dir={.git} --color=always -rnwi ./ -e $1 | grep $2
}

# search onli in package names starting with pattern
asa(){
	aptitude search ^$1 | awk '{print $2}'
	}

# create directory and move into it
mkcd () {
  mkdir "$1"
  cd "$1"
}
