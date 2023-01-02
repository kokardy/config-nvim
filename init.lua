require("user.options")
require("user.plugins")
require("user.keymaps")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")

require("user.yoshi").setup({
  title="保存ヨシ!",
  timeout=250,
  animate=false,
  render="simple",
  stages="slide",
})
