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
