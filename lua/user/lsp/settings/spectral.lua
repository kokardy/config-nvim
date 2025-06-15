local root_dir = function(fname)
  local util = require("lspconfig.util")
  local root_files = {
    ".spectral.yaml",
    ".git",
  }
  local root = util.root_pattern(unpack(root_files))(fname)
      or util.root_pattern(".git")(fname)
      or util.path.dirname(fname)
  return root
end

return {
  cmd = { "spectral-language-server", "-F hint", "--stdio" },
  filetypes = { "openapi" },
  settings ={
    enable=true,
    validateLanguages = { "openapi" },
  }
  -- root_dir = root_dir,
}
