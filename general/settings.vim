set encoding=UTF-8
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style

set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=/bin/sh
set background=dark
set nofoldenable
set smartcase
set backspace=indent,eol,start
set cpoptions+=$
set showmatch
set matchpairs+=<:>

set relativenumber
set inccommand=split

set splitbelow
set splitright

" For undotree
if has("persistent_undo")
  set undodir=~/.vim/undodir"
  set undofile
endif

let mapleader = " "

colorscheme seti

if executable('rg')
  let g:rg_derive_root='true'
endif

let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/bin/python2'

" Since fish shell is the system default, nvim has all kinds of issues
" executing system() calls. Setting `shell` fixes them. fzf-preview still
" seems to use fish though, which setting $SHELL fixes.
set shell=/bin/zsh
let $SHELL = "/bin/zsh"
