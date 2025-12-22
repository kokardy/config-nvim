-- simple to use language server installer
return {
  "williamboman/mason.nvim",
  -- event = { "BufEnter" },
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  config = function()
    require("user.lsp")
  end,
}
