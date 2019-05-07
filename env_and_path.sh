export ARCHFLAGS="-arch x86_64"
export EDITOR='vim'
export VISUAL='vim'
export PATH="$HOME/dotfiles/scripts:$PATH"

export BROWSER="firefox"
if hash most 2>/dev/null; then
	export PAGER="most"
else
	export PAGER="less"
fi
#export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

