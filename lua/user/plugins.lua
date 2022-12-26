local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use({
    "wbthomason/packer.nvim",
    --commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422"
  }) -- Have packer manage itself
  use({
    "nvim-lua/plenary.nvim",
    --commit = "968a4b9afec0c633bc369662e78f8c5db0eba249"
  }) -- Useful lua functions used by lots of plugins
  use({
    "windwp/nvim-autopairs",
    --commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec"
  }) -- Autopairs, integrates with both cmp and treesitter
  use({
    "numToStr/Comment.nvim",
    --commit = "2c26a00f32b190390b664e56e32fd5347613b9e2"
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    --commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269"
  })
  use({
    "kyazdani42/nvim-web-devicons",
    --commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e"
  })
  use({
    "kyazdani42/nvim-tree.lua",
    --commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243"
  })
  use({
    "akinsho/bufferline.nvim",
    --commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353"
  })
  use({
    "moll/vim-bbye",
    --commit = "25ef93ac5a87526111f43e5110675032dbcacf56"
  })
  use({
    "nvim-lualine/lualine.nvim",
    --commit = "3362b28f917acc37538b1047f187ff1b5645ecdd"
  })
  use({
    "akinsho/toggleterm.nvim",
    --commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8"
  })
  use({
    "ahmedkhalf/project.nvim",
    --commit = "541115e762764bc44d7d3bf501b6e367842d3d4f"
  })
  use({
    "lewis6991/impatient.nvim",
    --commit = "969f2c5c90457612c09cf2a13fee1adaa986d350"
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    --commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2"
  })
  use({
    "goolord/alpha-nvim",
    --commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94"
  })
  use("folke/which-key.nvim")

  -- Colorschemes
  use({ "folke/tokyonight.nvim" })
  use("lunarvim/darkplus.nvim")

  -- cmp plugins
  use({
    "hrsh7th/nvim-cmp",
    --commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a"
  }) -- The completion plugin
  use({
    "hrsh7th/cmp-buffer",
    --commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323"
  }) -- buffer completions
  use({
    "hrsh7th/cmp-path",
    --commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e"
  }) -- path completions
  use({
    "saadparwaiz1/cmp_luasnip",
    --commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36"
  }) -- snippet completions
  use({
    "hrsh7th/cmp-nvim-lsp",
    --commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8"
  })
  use({
    "hrsh7th/cmp-nvim-lua",
    --commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21"
  })

  -- snippets
  use({
    "L3MON4D3/LuaSnip",
    --commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a"
  }) --snippet engine
  use({
    "rafamadriz/friendly-snippets",
    --commit = "d27a83a363e61009278b6598703a763ce9c8e617"
  }) -- a bunch of snippets to use

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    --commit = "148c99bd09b44cf3605151a06869f6b4d4c24455"
  }) -- enable LSP
  use({
    "williamboman/nvim-lsp-installer",
    --commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6"
  }) -- simple to use language server installer
  use({
    "jose-elias-alvarez/null-ls.nvim",
    --commit = "ff40739e5be6581899b43385997e39eecdbf9465"
  }) -- for formatters and linters

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    --commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0"
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    --commit = "518e27589c0463af15463c9d675c65e464efc2fe",
  })
  use({ -- 関数名を表示
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            "class",
            "function",
            "method",
          },
        },
      })
    end,
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    --commit = "c18e016864c92ecf9775abea1baaa161c28082c3",
  })

  -- surround
  use({ "tpope/vim-repeat" })
  use({ "tpope/vim-surround" })

  -- hightlight
  use({ "t9md/vim-quickhl" })

  -- nerdfont
  use({ "lambdalisue/nerdfont.vim" })

  -- prevent from saving typo file
  use({ "tyru/stoptypofile.vim" })

  -- comment
  use({
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  })

  -- yank
  use({
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({
        -- highlight = {
        --   on_put = true
        --   on_yank = true
        --   timer = 500
        -- }
      })
    end,
  })

  -- trouble
  use({
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  })

  -- browser
  --[[ use({ "tyru/open-browser.vim" }) ]]

  -- markdown
  use({
    "preservim/vim-markdown",
    ft = { "markdown" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
    require = "godlygeek/tabular",
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_browser = "firefox"
    end,
    requires = { { "tyru/open-browser.vim", opt = true, }, },
  })
  use({ "mattn/vim-maketable", ft = { "markdown" } })

  -- plantuml
  use({
    "weirongxu/plantuml-previewer.vim",
    ft = { "plantuml" },
    requires = { { "tyru/open-browser.vim", opt = true, }, },
  })
  use({ "aklt/plantuml-syntax", ft = { "plantuml" } })

  -- csv
  use({ "mechatroner/rainbow_csv", ft = { "csv" } })

  -- github
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  })

  -- debug
  use({
    'rcarriga/nvim-dap-ui',
    requires = {
      "mortepau/codicons.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap",
      { 'mfussenegger/nvim-dap-python', tf = { "python" } },
    },
    ft = {
      "python",
      "go",
      --[[ "lua", ]]
      --[[ "javasript", ]]
      --[[ "typescript", ]]
      --[[ "julia", ]]
      --[[ "haskell", ]]
    },
    config = function()
      require("user.dap.init").setup()
    end
  })

  -- mark
  use({ "chentoast/marks.nvim",
    config = function()
      require 'marks'.setup {
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { ".", "<", ">", "^" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions.
        -- higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = "⚑",
          virt_text = "hello world"
        },
        mappings = {}
      }
    end })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
