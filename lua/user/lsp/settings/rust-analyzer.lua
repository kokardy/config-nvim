
return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_dir = require('lspconfig.util').root_pattern('Cargo.toml', 'rust-project.json'),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      }
    }
  }
}
