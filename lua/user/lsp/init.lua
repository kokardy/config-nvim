local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.configs").setup()
require("user.lsp.handlers").setup()
