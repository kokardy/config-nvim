" for non VSCode environment
"

"NOT VSCODE
colorscheme mrkn256
" colorscheme molokai
" colorscheme vividchalk
" colorscheme hybrid
" colorscheme codedark
"
"
"""""""""""""""""""""""""""""""""""""""""""
" trouble
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

"""""""""""""""" treesitter config lua
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

""""""""""""""""""""""""""""""""""""""""""
" NERDTree toggle
" VSCodeでは利かない
nnoremap <C-t> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""
" 自動フォーマット系

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

""""""""""""""""""""""""""""""""""""""""""
" indent guid on
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""""""""""""
" vim-airline settings
let g:airline_theme = 'tomorrow'
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

" auto import(organize import)
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>m :CocList outline -kind method<CR>
