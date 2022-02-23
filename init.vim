set number
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set hls

set showmatch
set indentkeys-=:
set cinkeys-=:

" background 半透明
set pumblend=10

colorscheme ron

set fileencodings=utf-8,sjis
set fileformats=unix,dos

nnoremap j gj
nnoremap k gk

let mapleader = "\<Space>"

" <leader> a で全選択コピー
nnoremap <leader>a ggVG"+y

call plug#begin('~/.config/nvim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'mattn/emmet-vim', {'for': ['html', 'xml']}
  Plug 'tomtom/tcomment_vim'
  Plug 'psf/black', {'for': ['python']}
  Plug 'rust-lang/rust.vim', {'for': ['rust']}
  Plug 'junegunn/vim-easy-align'
  Plug 'nvie/vim-flake8'
  if !exists('g:vscode')
    Plug 'sersorrel/vim-lilypond', {'for': ['ly']}
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'vim-scripts/taglist.vim'
    Plug 'szw/vim-tags'
    Plug 'mechatroner/rainbow_csv'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
    " Plug 'mattn/vim-goimports'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'mattn/ctrlp-matchfuzzy'
    Plug 'alvan/vim-closetag', {'for': ['html', 'xml']}
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'thinca/vim-quickrun'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'

    """""""""""""""""" colorschemes """""""""""""""""""""
    Plug 'tomasr/molokai'
    Plug 'tpope/vim-vividchalk'
    Plug 'mrkn/mrkn256.vim'

    """""""""""""""""" git """"""""""""""""""""""""""""""
    Plug 'nvim-lua/plenary.nvim' | Plug 'tanvirtin/vgit.nvim'

    " Plug 'sickill/vim-sunburst'
    " Plug 'tomasiser/vim-code-dark'
    " Plug 'w0ng/vim-hybrid'
    " Plug 'jdkanani/vim-material-theme'
    """""""""""""""""""""""""""""""""""""""""""""""""""""
  endif
call plug#end()
"Plug end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:vscode')
  runtime init/non_vscode.vim
  runtime init/vgit.vim
endif

" markdown table align
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" ctrlP FuzzyFinder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" ctrlP faster match func
" neovimだと利かない？
" let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}

if !exists('g:python3_host_prog')
  let g:python3_host_prog = '/usr/bin/python3'
endif

filetype indent plugin on
set smartindent
