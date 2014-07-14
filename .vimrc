" Vim configuration file

" DEFAULT OPTIONS
set nocompatible			" make Vim default to nicer options

" READING OPTIONS
set modeline modelines=1		" use settings from file being edited

" INPUT OPTIONS
set mouse=a				" use the mouse

" DISPLAY OPTIONS
set background=light			" better colors for white terminals
:colorscheme torte
set number				" show line numbers
set ruler				" show line and column information
set notitle				" don't set change terminal's title
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
set showcmd				" show partial commands
set more				" use a pager for long listings
set nowrap				" wrap long lines
syntax on				" use syntax highlighting
"set autochdir
 
" SAVING OPTIONS

set backupext=~				" backup files end in ~

" EDITING OPTIONS
set autoindent				" keep indenting at same level
set noerrorbells visualbell		" flash screen instead of ringing bell
set esckeys				" allow arrow keys in insert mode
set showmatch				" show matching brackets

" COMPLETE OPTIONS
set complete=.,i,w,b
let Vimplate="/usr/bin/vimplate"

" SEARCH OPTIONS
set nohlsearch				" don't highlight search patterns
set incsearch				" search while typing
set ignorecase				" make searches case-insensitive

" MISCELLANEOUS OPTIONS
" set dictionary=/usr/share/dict/words	" get words from system dictionary
set magic				" regexp chars have special meaning

function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
endfunction

imap <C-W> <ESC><C-w>w<CR>
inoremap <C-D> <C-R>=CleverTab()<CR>
map <F2> :bp!<CR>
imap <F2> <ESC>:bp!<CR>
map <F3> :bn!<CR>
imap <F2> <ESC>:bn!<CR>

" source ~/.vim/plugin/MakeMatlabComment.vim

" map <F9> :call MakeMatlabComment()<CR> 
" imap <F9> <ESC>:call MakeMatlabComment()<CR>
