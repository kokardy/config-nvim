local status_ok, lsp_installer = pcall(require, "mason")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

local M = {}

local servers = {
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

  -- spectral efmに移行
  -- "spectral",

  -- svelte
  "svelte",

  -- typescript
  "ts_ls",

  -- sql
  "sqlls",
}

M.servers = servers

M.setup = function()
  lsp_installer.setup({
    ensure_installed = servers,
  })

  for _, server in pairs(servers) do
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
