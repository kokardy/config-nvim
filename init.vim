set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set hls

set showmatch

" background 半透明
set pumblend=3

colorscheme ron


nnoremap j gj
nnoremap k gk

let mapleader = "\<Space>"

" <leader> a で全選択コピー
nnoremap <leader>a ggVG"+y

call plug#begin('~/.config/nvim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim', {'for': ['html', 'xml']}
  Plug 'tomtom/tcomment_vim'
  Plug 'psf/black', {'for': ['python']}
  Plug 'rust-lang/rust.vim', {'for': ['rust']}
  Plug 'junegunn/vim-easy-align'
  Plug 'nvie/vim-flake8'
  if !exists('g:vscode')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'mattn/vim-goimports'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'mattn/ctrlp-matchfuzzy'
    Plug 'alvan/vim-closetag', {'for': ['html', 'xml']}
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'thinca/vim-quickrun'
    Plug 'nvim-treesitter/nvim-treesitter', {'merged': 0}

    """""""""""""""""" colorschemes """""""""""""""""""""    
    Plug 'tomasr/molokai'
    Plug 'tpope/vim-vividchalk'
    Plug 'mrkn/mrkn256.vim'

    " Plug 'sickill/vim-sunburst'
    " Plug 'tomasiser/vim-code-dark'
    " Plug 'w0ng/vim-hybrid'
    " Plug 'jdkanani/vim-material-theme'
    """""""""""""""""""""""""""""""""""""""""""""""""""""
  endif
call plug#end()
"Plug end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" golang struct tag
autocmd FileType go nmap <leader>tj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap <leader>ty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap <leader>tp :CocCommand go.tags.add.prompt<cr>
autocmd FileType go nmap <leader>tc :CocCommand go.tags.clear.line<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

"NOT VSCODE
if !exists('g:vscode')
  colorscheme mrkn256
  " colorscheme molokai
  " colorscheme vividchalk
  " colorscheme hybrid
  " colorscheme codedark
  "
  "
"""""""""""""""""""""""""""""""""""""""""""
" treesitter config lua
  
  lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = {
      -- 'c_sharp',
      -- 'vue',
    }
  },
}
EOF
""""""" treesitter config end """""""""""""

endif "NOT VSCODE END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" 自動フォーマット系

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" """""""""""""""""""""""""""""""
" """coc-settings.jsonに移行
" """Python BLACK VSCodeでは利かない
" autocmd bufWritePost *.py :Black
" """""""""""""""""""""""""""""""

" Go vim-goimports
let g:goimports = 1

""""""""""""""""""""""""""""""""""""""""""
" indent guid on
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""""""""""""
" NERDTree toggle
" VSCodeでは利かない
nnoremap <C-t> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""
" vim-airline settings
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 1

""""""""""""""""""""""""""""""""""""""""""
" closetag settings
" VSCodeでは利かない

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
