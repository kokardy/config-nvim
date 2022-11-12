-- pyright
require 'lspconfig'.pyright.setup {}

-- lua

local sumneko_root = './lua-language-server'
require 'lspconfig'.sumneko_lua.setup {
  cmd = {
    sumneko_root .. '/bin/lua-language-server',
    '-E',
    sumneko_root .. '/main.lua',
  },
  -- capabilities = custom_capabilities(),
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = {
        enable = true,
        globals = {'vim'},
      },
    }
  },
}
