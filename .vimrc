" inspired by:
"
" TODO: read http//stevelosh.com/blog/2010/09/coming-home-to-vim/
" TODO: check: https://github.com/nvie/vimrc
" Dan Sheffner,Martin Brochhaus (Presented at PyCon APAC 2012)
"
" Some nice tips after you get bit of experience:
" https://hackernoon.com/learning-vim-what-i-wish-i-knew-b5dca186bef7
" ================== PLUGINS =========================
set nocompatible              " use vim improvements compared to vi
filetype off                  " required

set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim 			" set the runtime path to include Vundle and initialize

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" not working with python (some problems with python 3)
"Bundle 'Valloric/YouCompleteMe'

" additional configuration for vim
Bundle 'tpope/vim-sensible'

" guidelines for indentation
Bundle 'Yggdroot/indentLine'

" powerline replacement
Plugin 'itchyny/lightline.vim'

Bundle 'airblade/vim-gitgutter'

" nice startup screen when vim openerd without any file
Bundle 'mhinz/vim-startify'

" for snippets (mainly my own templates for documents)
"Bundle 'sirver/UltiSnips'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" to map 'jk' and 'kj' to ESC
Bundle 'zhou13/vim-easyescape'

Bundle 'majutsushi/tagbar'

Bundle 'vimwiki/vimwiki'
" Try alternative, together with his dotnvim repo
"Bundle 'lervag/wiki'

" markdown preview
Bundle 'suan/vim-instant-markdown'

" for learning vim
Bundle 'wikitopian/hardmode'

" to search
"Bundle 'kien/ctrlp.vim'

" Python plugins
" Plugin 'janko-m/vim-test'
" Plugin 'python-mode/python-mode'
" Bundle 'nvie/vim-flake8'
"Plugin 'thesheff17/youtube/master/vim/python_editing.vim'

call vundle#end()
" =================== / PLUGINS ===============================
filetype plugin indent on


"========================
" GENERAL SETTINGS
"========================
autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc

" gets rid of extra space (tailing spaces in the end of the line)
autocmd BufWritePre * %s/\s\+$//e

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>				" map ESC to jk
cnoremap kj <ESC>				" map ESC to kj


nmap <C-N><C-N> :set invnumber<CR> :GitGutterToggle<CR> " toggle numbers and git gutter by hitting C-n twice

set bs=2 " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","             " change leaderkey to comma (,)

noremap <C-n> :nohl<CR>         " Removes highlight of your last search
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

noremap <C-Z> :update<CR>       " Quicksave command
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

noremap <Leader>e :quit<CR>     " Quit current window
noremap <Leader>E :qa!<CR>      " Quit all windows

"map <c-j> <c-w>j                " already reserved for moving line(s) up/down
"map <c-k> <c-w>k
map <c-l> <c-w>j 				 " (not working now) bind Ctrl+l/h keys to move to the right/left window, instead of using Ctrl+w + <movement>
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>     " moving between tabs
map <Leader>m <esc>:tabnext<CR>			" conflict with markdown preview?

vnoremap <Leader>s :sort<CR>            " map sort function to a key

" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv                          " better indentation (in visual mode)
vnoremap > >gv

" Show tailing whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red  " highlight tailing spaces
au InsertLeave * match ExtraWhitespace /\s\+$/      " remove tailing whitespaces at exit

" Color scheme
set t_Co=256
color wombat256mod

syntax on 								" Enable syntax highlighting

" Showing absolute line numbers for cursor line and relative for other lines
set number 						" show line numbers
" set relativenumber				" show relative line numbers

set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs ??
vmap Q gq                       " easier formatting paragraphs (?)
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" disable arrows in normal mode
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

nnoremap <F5> "=strftime("%Y-%m-%d")<CR>		" insert current date
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

" Enable vim Hardmode by default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set wildmenu
set wildmode=list:longest,full

" Clipboard configuration
" unnamed - register is the selection buffer (try to select something with the
"           mouse and then center click or click both sx and dx mouse buttons
"           in another place).
" unnamedplus - register is actually the system clipboard
"
set clipboard=unnamed

" paste toggle
set pastetoggle=<F2>                  " map paste toggle to F2

nnoremap <c-j> :m .+1<CR>==             " move selected lines up/down with CTRL+j/k
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

"===========================================================================
" vim-airline
"===========================================================================
"let g:airline#extensions#tabline#enabled=1
"let g:airline_powerline_fonts=1
"let g:airline_theme='wombat'  " powerlineish | badwolf
set laststatus=2
set encoding=utf-8
"let g:airline_left_sep=''		" Don't show seperators (in case powerline fonts are not working
"let g:airline_right_sep=''

"============================================================================
" Python IDE Setup
"===========================================================================
" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newwin = vnew
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" let g:pymode_rope_lookup_project = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>  " insert breakpoint


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Neocomplete
" let g:neocomplete#enable_at_startup = 1

" turn off auto complete
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0

"====================================================
" wiki
"====================================================
"let g:wiki_root = '~/wiki'

"=====================================================
" vimwiki with markdown support
"=====================================================
"let g:vimwiki_list = [{'path': '~/Dropbox/wiki', 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list = [{'path': '~/vimwiki',
  \ 'path_html': '~/vimwiki_html',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'custom_wiki2html': '~/dotfiles/srcipts/wiki2html.sh',
  \ 'diary_rel_path': 'diary/',
  \ 'diary_index': 'diary'}]

" Have vimwiki set filetype only within wikihome
let g:vimwiki_ext2syntax = {}

"let s:vimwiki = {}
"let s:vimwiki.path = '~/Dropbox/wiki'
"let s:vimwiki.path_html = '~/Dropbox/wiki_html'
"let s:vimwiki.ext = '.md'
"let s:vimwiki.syntax = 'markdown'
"let s:vimwiki.diary_rel_path = 'diary_index/'
"let s:vimwiki.diary_index = 'index'
"let s:vimwiki.diary_header = 'Diary'
"let s:vimwiki.diary_sort = 'asc'

"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"let g:vimwiki_list = [{'path':'~/Dropbox/wiki', 'path_html':'~/Dropbox/wiki_export/html/'}]
" help page -> :h vimwiki-syntax

" open vimwiki diary note for today if vim called with dummy file:
" DiaryNoteToday
autocmd VimEnter * if argv() ==# ['DiaryNoteToday'] | execute 'VimwikiMakeDiaryNote' | endif

" use 'd' in vimwiki mode to jump to today's diary note
"autocmd FileType vimwiki map d :VimwikiMakeDiaryNote<CR>

:let g:vimwiki_table_mappings = 0	"to make vim-snippets working
:let g:vimwiki_autowriteall = 0 " to fix error with ultisnip
:let s:vimwiki_autowriteall = 0 " to fix error with ultisnip
"=====================================================
" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
" autocmd BufEnter *.py :call tagbar#autoopen(0)
" autocmd BufWinLeave *.py :TagbarClose " ! causes error on leave

"===================================================
" Instant markdown
"====================================================
let g:instant_markdown_autostart = 1    " disable autostart
map <leader>md :InstantMarkdownPreview<CR>  " leader+md - markdown preview

"====================================================
" YouCompleteMe
"====================================================
set completeopt-=preview
"let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
nmap <leader>g :YcmCompleter GoTo<CR>           " YCM goto with leader-g
nmap <leader>d :YcmCompleter GoToDefinition<CR> " YCM goto definition with leader-d

" hint: use (or map) YP to duplicate line


" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

