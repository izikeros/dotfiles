" TODO:
" based on .vimrc file by:
" Dan Sheffner,Martin Brochhaus (Presented at PyCon APAC 2012)

" ================== PLUGINS =========================
set nocompatible              " be iMproved, required
filetype off                  " required

set shell=/bin/bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ---- code completion
Bundle 'Valloric/YouCompleteMe'
" ---- navigation
" panel with directory tree
Bundle 'scrooloose/nerdtree'

" This plugin aims at making NERDTree feel like a true panel, independent of
" tabs. Just one NERDTree, always and ever. It will always look the same in
" all tabs, including expanded/collapsed nodes, scroll position etc.
" Bundle 'jistr/vim-nerdtree-tabs'tabs

" additional configuration:
Bundle 'tpope/vim-sensible'

" guidelines for indentation
Bundle 'Yggdroot/indentLine'

" ---- powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" fuzzy find files
Bundle 'kien/ctrlp.vim'

"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'jeetsukumaran/vim-buffergator'
" Bundle 'majutsushi/tagbar'

Bundle 'airblade/vim-gitgutter'

" nice startup screen when vim openerd without any file
Bundle 'mhinz/vim-startify'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the
" current file and get an overview of its structure. It does this by creating a
" sidebar that displays the ctags-generated tags of the current file, ordered
" by their scope. This means that for example methods in C++ are displayed
" under the class they are defined in.
Bundle 'majutsushi/tagbar'

Bundle 'vimwiki/vimwiki'
Bundle 'suan/vim-instant-markdown'

Bundle 'wikitopian/hardmode'

" ---- Python
Plugin 'janko-m/vim-test'
Plugin 'python-mode/python-mode'
Bundle 'nvie/vim-flake8'
"Plugin 'thesheff17/youtube/master/vim/python_editing.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " require
" =================== / PLUGINS ===============================



" ----- vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'  " powerlineish | badwolf
set laststatus=2
set encoding=utf-8
" Don't show seperators (in case powerline fonts are not working
"let g:airline_left_sep=''
"let g:airline_right_sep=''

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" gets rid of extra space (tailing spaces in the end of the line)
autocmd BufWritePre * %s/\s\+$//e

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" map ctrl n to line numbers
:nmap <C-N><C-N> :set invnumber<CR>

" Mouse and backspace
set bs=2 " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" --- Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype plugin indent on
syntax on

" ??
set nocp

" Showing absolute line numbers for cursor line and relative for other lines
set number 						" show line numbers
" set relativenumber				" show relative line numbers

set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs ??
vmap Q gq
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

" ============================================================================
" Python IDE Setup
" ============================================================================

" Enable vim Hardmode by default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" disable arrows in normal mode
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

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
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Neocomplete
" let g:neocomplete#enable_at_startup = 1
"
set wildmenu
set wildmode=list:longest,full

" Clipboard configuration
" unnamed - register is the selection buffer (try to select something with the
"           mouse and then center click or click both sx and dx mouse buttons
"           in another place).
" unnamedplus - register is actually the system clipboard
"
set clipboard=unnamed

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
"autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>
" map <F5> :NERDTreeToggle<cr><c-w>p

" load up the nerd tree
" autocmd vimenter * NERDTree
map <Leader>t <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" move to the first buffer
" autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1

" paste toggle
set pastetoggle=<F2>

" turn off auto complete
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

" ===================================================
" Instant markdown
" ====================================================
let g:instant_markdown_autostart = 0    " disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" ====================================================
" YouCompleteMe
" ====================================================
set completeopt-=preview
"
"let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
"
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>
