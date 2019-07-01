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
Plugin 'Valloric/YouCompleteMe'

" Deoplete (as autocomplete)
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'roxma/nvim-yarp'
"Plugin 'roxma/vim-hug-neovim-rpc'

"Plugin 'davidhalter/jedi-vim'

" additional configuration for vim
Plugin 'tpope/vim-sensible'

" guidelines for indentation
Plugin 'Yggdroot/indentLine'

" powerline replacement
Plugin 'itchyny/lightline.vim'

Plugin 'airblade/vim-gitgutter'

" nice startup screen when vim openerd without any file
"Plugin 'mhinz/vim-startify'

if (has('python') || has('python3'))
    " for snippets (mainly my own templates for documents)
    Plugin 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    Plugin 'honza/vim-snippets'
else
    Plug 'garbas/vim-snipmate'
    Plug 'MarcWeber/vim-addon-mw-utils' "required for snipmate
    Plug 'tomtom/tlib_vim' "required for snipmate
endif

"Plugin 'majutsushi/tagbar'

" markdown preview
" requires installation of:
" [sudo] npm -g install instant-markdown-d
" Plugin 'suan/vim-instant-markdown'

" to search
"Plugin 'kien/ctrlp.vim'

" Python plugins
" Plugin 'janko-m/vim-test'
" Plugin 'python-mode/python-mode'
" Plugin 'nvie/vim-flake8'
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

" Toggle line numbering (usefull when selecting text to copy)
nmap <C-N><C-N> :set invnumber<CR> :GitGutterToggle<CR> " toggle numbers and git gutter by hitting C-n twice
nmap <C-L><C-L> :set invrelativenumber<CR> " toggle relative line number

" Showing absolute line numbers for cursor line and relative for other lines
set number 						" show line number for the cursor
set relativenumber				" show relative line numbers (norelativenumber to disable)

set bs=2 " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","             " change leaderkey to comma (,)

noremap <C-n> :nohl<CR>         " Removes highlight of your last search
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" quick save
noremap <C-Z> :update<CR>       " Quicksave command
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

noremap <Leader>e :quit<CR>     " Quit current window
noremap <Leader>E :qa!<CR>      " Quit all windows

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>     " moving between tabs
map <Leader>m <esc>:tabnext<CR>			" conflict with markdown preview?

vnoremap <Leader>s :sort<CR>            " map sort function to a key

" Try to go into visual mode (v), then select several lines of code here and
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

" Wrapping and margins
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Useful settings
set history=700
set undolevels=700

" Use TABs instead of spaces for indentation
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

" Disable backup and swap files - they trigger too many events for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Inset current time
nnoremap <F5> "=strftime("%Y-%m-%d")<CR>		" insert current date
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

" What is wildmenu???
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

nmap <F6> :w<CR>:silent !chmod 755 %<CR>:silent !./% > .tmp.xyz<CR>
     \ :tabnew<CR>:r .tmp.xyz<CR>:silent !rm .tmp.xyz<CR>:redraw!<CR>

" ==================================================
" Deoplete
" ==================================================
"let g:deoplete#enable_at_startup = 1

"===================================================
" Ultisnips
"===================================================
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets="<c-l>"

