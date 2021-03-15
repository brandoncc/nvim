" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')


" " Indented groups are order dependent
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"   Plug 'antoinemadec/coc-fzf'

    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'junegunn/fzf.vim'
    " Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/completion-treesitter'

" Sort command:
" :'<,'>sort /\/[A-z]/ ri
Plug 'skywind3000/asyncrun.vim'
Plug 'metakirby5/codi.vim'
Plug 'steelsojka/completion-buffers'
Plug 'elixir-editors/vim-elixir'
Plug 'brandoncc/vim-easylog'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'dag/vim-fish'
Plug 'alepez/vim-gtest'
Plug 'keith/investigate.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'danro/rename.vim'
Plug 'tpope/vim-repeat'
Plug 'trusktr/seti.vim'
Plug 'norcalli/snippets.nvim'
Plug 'vimlab/split-term.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'wellle/targets.vim'
Plug 'sirver/UltiSnips'
Plug 'brandoncc/ultisnips-refactor.vim'
Plug 'mbbill/undotree'
Plug 'junegunn/vader.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'jremmen/vim-ripgrep'
Plug 'ThePrimeagen/vim-be-good'
Plug 'christoomey/vim-system-copy'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'andymass/vim-matchup'
Plug 'honza/vim-snippets'
Plug 'sorin-ionescu/vim-ruby-block-conv'
Plug 'vimwiki/vimwiki'

" Always load dev icons last!!
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
