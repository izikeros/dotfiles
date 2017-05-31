" Vim configuration file
" DEFAULT OPTIONS
set nocompatible			" make Vim default to nicer options

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" ==================== PLUGINS =============
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" code completion
Bundle 'Valloric/YouCompleteMe'
" navigation
Bundle 'Lokaltog/vim-easymotion'
" ??
Bundle 'nathanaelkane/vim-indent-guides'
" ??
Bundle 'kien/ctrlp.vim'
" ??
Bundle 'terryma/vim-multiple-cursors'
" ??
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'majutsushi/tagbar'
" Python
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" Themes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Plugin 'sickill/vim-monokai'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ============== /PLUGINS ==============

" DISPLAY OPTIONS
set background=dark			" better colors for white terminals
colorscheme monokai	 		" solarized zenburn torte dracula

" READING OPTIONS
set modeline modelines=1		" use settings from file being edited

" INPUT OPTIONS
set mouse=a				" use the mouse
set paste				" to preserve indentation while copy-paste

" Vim usually has its own clipboard and ignores the system keyboards,
" but sometimes you might want to cut, copy, and/or paste to/from other 
" applications outside of VIM. On OSX, you can access your system clipboard 
" with this line:
set clipboard=unnamed

set relativenumber			" show relative line numbers
" set number				" show line numbers

set ruler					" show line and column information
set notitle					" don't set change terminal's title
set backspace=2				" backspaces can go over lines
set tabstop=4				" tabs are every 8 columns
:if version >= 600
  set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<
:elseif version >= 500
  set listchars=eol:$,tab:>-,trail:-,extends:+
:endif
set laststatus=2			" always show status line
set showmode				" always show command or insert mode
set shortmess=lnrxI			" brief messages, don't show intro
set showcmd					" show partial commands
set more					" use a pager for long listings
set nowrap					" wrap long lines
syntax on					" use syntax highlighting

"set autochdir
 
" SAVING OPTIONS
set backupext=~					" backup files end in ~

" EDITING OPTIONS
set autoindent					" keep indenting at same level
set noerrorbells visualbell		" flash screen instead of ringing bell
set esckeys						" allow arrow keys in insert mode
set showmatch					" show matching brackets

" COMPLETE OPTIONS
set complete=.,i,w,b
let Vimplate="/usr/bin/vimplate"

" SEARCH OPTIONS
set nohlsearch				" don't highlight search patterns
set incsearch				" search while typing
set ignorecase				" make searches case-insensitive

" MISCELLANEOUS OPTIONS
" set dictionary=/usr/share/dict/words	" get words from system dictionary
set magic					" regexp chars have special meaning
set history=1000            " Store a ton of history (default is 20)
let python_highlight_all=1	" enable Python highligting (syntastic?)


" toggle relative numbering C-n
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
endfunction

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

imap <C-W> <ESC><C-w>w<CR>
inoremap <C-D> <C-R>=CleverTab()<CR>
map <F2> :bp!<CR>
imap <F2> <ESC>:bp!<CR>
map <F3> :bn!<CR>
imap <F2> <ESC>:bn!<CR>


