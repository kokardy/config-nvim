local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace = {
  didChangeWatchedFiles = {
    dynamicRegistration = true,
  },
}
return {
  capabilities = capabilities,
}
