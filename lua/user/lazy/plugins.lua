return {
  -- plugins

  -- {
  --   "moll/vim-bbye",
  -- },

  -- Luaのモジュールをバイトコードとしてキャッシュしたり、モジュールに対応するパスをキャッシュすることで、Neovimの起動を高速化します。
  {
    "lewis6991/impatient.nvim",
    config = function()
      local impatient = require("impatient")
      impatient.enable_profile()
    end,
  },


  { import = "user.lazy.plugins.treesitter" },
  { import = "user.lazy.plugins.telescope" },
  { import = "user.lazy.plugins.cmp" },
  { import = "user.lazy.plugins.colorschemes" },
  { import = "user.lazy.plugins.edit" },
  { import = "user.lazy.plugins.filer" },
  { import = "user.lazy.plugins.git" },
  { import = "user.lazy.plugins.keymap" },
  { import = "user.lazy.plugins.lsp" },
  { import = "user.lazy.plugins.project" },
  { import = "user.lazy.plugins.status" },
  { import = "user.lazy.plugins.terminal" },
  { import = "user.lazy.plugins.tool" },
  { import = "user.lazy.plugins.ai" },

}
