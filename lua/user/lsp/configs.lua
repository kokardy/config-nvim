local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end
mason.setup()

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end
local mlspconfig_ok, mlspconfig = pcall(require, "mason-lspconfig")
if not mlspconfig_ok then
  return
end

-- local lspconfig = require("lspconfig")

local M = {}

M.servers = {
  -- efm
  "efm",

  -- json
  "jsonls",

  -- lua
  -- "sumneko_lua",
  "lua_ls",

  -- python
  "pyright",
  "ruff",
  -- "pylsp",

  -- go
  "gopls",

  -- rust
  "rust_analyzer",

  -- markdown
  "marksman",
  -- "remark_ls",

  -- toml
  "taplo",

  -- bash
  "bashls",

  -- yaml
  "yamlls",

  -- svelte
  "svelte",

  -- typescript
  "ts_ls",

  -- sql
  "sqls",
}

M.setup = function()
  mlspconfig.setup({
    automatic_enable = true,
    ensure_installed = M.servers,
  })

  for _, server in pairs(M.servers) do
    local opts = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    lspconfig[server].setup(opts)
  end
end
return M
