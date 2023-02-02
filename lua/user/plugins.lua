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
  }) -- Have packer manage itself

  use({
    "nvim-lua/plenary.nvim",
  }) -- Useful lua functions used by lots of plugins

  use({
    "windwp/nvim-autopairs",
    event = { "BufEnter" },
    config = function()
      require("user.autopairs")
    end,
    requires = {
      { "hrsh7th/nvim-cmp", },
      { "nvim-treesitter/nvim-treesitter" },
    },
    wants = {
      "nvim-cmp",
      "nvim-treesitter",
    },
  }) -- Autopairs, integrates with both cmp and treesitter

  use({
    "numToStr/Comment.nvim",
    event = { "VimEnter" },
    config = function()
      require("user.comment")
    end
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
  })
  use({
    "kyazdani42/nvim-web-devicons",
  })
  use({
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTree*" },
    config = function()
      require("user.nvim-tree")
    end,
  })
  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("user.bufferline")
    end,
  })
  use({
    "moll/vim-bbye",
  })
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("user.lualine")
    end
  })
  use({
    "akinsho/toggleterm.nvim",
    event = { "VimEnter" },
    config = function()
      require("user.toggleterm")
    end
  })
  use({
    "ahmedkhalf/project.nvim",
  })
  use({
    "lewis6991/impatient.nvim",
    config = function()
      require("user.impatient")
    end
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("user.indentline")
    end,
  })
  use({
    "goolord/alpha-nvim",
    config = function()
      require("user.alpha")
    end,
  })
  use({
    "folke/which-key.nvim",
    event = { "VimEnter" },
    config = function()
      require("user.whichkey")
    end,
  })

  -- Colorschemes
  use({ "lunarvim/darkplus.nvim" })
  use({ "folke/tokyonight.nvim", opt = true })

  -- cmp plugins
  use({
    "hrsh7th/nvim-cmp",
    module = { "cmp" },
    config = function()
      require("user.cmp")
    end,
    requires = {
      { "hrsh7th/cmp-buffer", event = { "InsertEnter" }, },
      { "hrsh7th/cmp-path", event = { "InsertEnter" }, },
      { "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" }, },
      { "hrsh7th/cmp-nvim-lua", event = { "InsertEnter" }, },
      { "uga-rosa/cmp-dictionary", event = { "InsertEnter" },
        config = function()
          require("cmp_dictionary").setup({
            dic = {
              ["*"] = { "/usr/share/dict/words" },
            },
            exact = 2,
            first_case_insensitive = false,
            document = false,
            document_command = "wn %s -over",
            async = false,
            max_items = -1,
            capacity = 5,
            debug = false,
          })
        end,
      },
      { "saadparwaiz1/cmp_luasnip", event = { "InsertEnter" }, },
    },
  })

  -- snippets
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
    end
  }) --snippet engine

  use({
    "rafamadriz/friendly-snippets",
  }) -- a bunch of snippets to use

  -- LSP
  use({ "neovim/nvim-lspconfig",
    event = { "BufEnter" },
    config = function()
      require("user.lsp") --
    end,
    -- requires = { { "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" }, } },
  })
  -- enable LSP
  use({
    "williamboman/nvim-lsp-installer",
    event = { "BufEnter" },
  }) -- simple to use language server installer
  use({
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufEnter" },
  }) -- for formatters and linters

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    event = { "VimEnter" },
    config = function()
      require("user.telescope")
    end,
    requires = {
      "hrsh7th/nvim-cmp",
    },
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("user.treesitter")
    end,
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

  -- git mark
  use({
    "lewis6991/gitsigns.nvim",
    event = { "BufEnter" },
    config = function()
      require("user.gitsigns")
    end,
  })

  -- rich commit message
  use({ "rhysd/committia.vim" })

  -- surround
  -- use({ "tpope/vim-repeat" })
  -- use({ "tpope/vim-surround" })
  use({ "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })

  -- highlight
  use({ "t9md/vim-quickhl" })

  -- nerdfont
  use({ "lambdalisue/nerdfont.vim" })

  -- prevent from saving typo file ":w ["
  use({ "tyru/stoptypofile.vim" })

  -- comment
  use({
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  })

  -- outline
  use({ "fcying/telescope-ctags-outline.nvim",
    event = { "VimEnter" },
    requires = { "nvim-telescope/telescope.nvim" },
    wants = { "telescope.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        extensions = {
          ctags_outline = {
            --ctags option
            ctags = { 'ctags' },
            --ctags filetype option
            ft_opt = {
              vim = '--vim-kinds=fk',
              lua = '--lua-kinds=fk',
              go = '--go-kinds=f',
              rust = '--rust-kinds=fPM',
              python = '--python-kinds=fm --language-force=Python',
            },
          },
        },
      }

      telescope.load_extension('ctags_outline')
    end,
  })

  use({ "stevearc/aerial.nvim",
    config = function()
      require('aerial').setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end
      })

      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>')
    end
  })


  -- document
  use({ "danymat/neogen",
    config = function()
      require('neogen').setup({
        enabled = true,
        snippet_engine = "luasnip",
        languages = {
          python = {
            template = {
              annotation_convention = "google_docstrings", -- for a full list of annotation_conventions, see supported-languages below,
              --[[ annotation_convention = "numpydoc", ]]
              --[[ annotation_convention = "reST", ]]
            }
          },
        }
      })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  })

  -- yank
  use({
    "gbprod/yanky.nvim",
    event = { "VimEnter" },
    requires = {
      { "nvim-telescope/telescope.nvim", opt = true, },
    },
    wantas = { "telescope.nvim" },
    config = function()
      -- local utils = require("yanky.utils")
      local mapping = require("yanky.telescope.mapping")
      require("yanky").setup({
        picker = {
          telescope = {
            mappings = {
              default = mapping.put("p"),
              i = {
                ["C-p"] = mapping.put("p"),
                -- ["S-P"] = mapping.put("P"),
                -- [your keymap] = mapping.delete(),
                -- [your keymap] = mapping.set_register(utils.get_default_register()),
              },
              -- n = {
              --   [your keymap] = mapping.put("p"),
              --   [your keymap] = mapping.put("P"),
              --   [your keymap] = mapping.delete(),
              --   [your keymap] = mapping.set_register(utils.get_default_register())
              -- },
            }
          },
          -- select = {
          --   action = nil, -- nil to use default put action
          -- },
        },
      })
      require("telescope").load_extension("yank_history")
      vim.keymap.set('n', '<leader>yr', '<cmd>Telescope yank_history<CR>')
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
    event = { "VimEnter" },
    requires = {
      { "nvim-lua/plenary.nvim", opt = true, },
      { "nvim-telescope/telescope.nvim", opt = true, },
      { "kyazdani42/nvim-web-devicons", opt = true, },
    },
    wants = {
      "plenary.nvim",
      "telescope.nvim",
      "nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  })

  -- debug
  use({
    'rcarriga/nvim-dap-ui',
    requires = {
      { "mortepau/codicons.nvim", opt = true, },
      { "theHamsta/nvim-dap-virtual-text", opt = true, },
      { "mfussenegger/nvim-dap", opt = true, },
      { 'mfussenegger/nvim-dap-python', opt = true, ft = { "python" } },
    },
    ft = {
      "python",
      "go",
      --[[ "lua", ]]
      --[[ "javascript", ]]
      --[[ "typescript", ]]
      --[[ "julia", ]]
      --[[ "haskell", ]]
    },
    config = function()
      require("user.dap.init").setup()
    end
  })

  -- quickfix preview
  use({ "kevinhwang91/nvim-bqf" })

  -- mark
  use({ "chentoast/marks.nvim",
    config = function()
      require("user.marks").config()
    end })

  -- rainbow parentheses
  use({ "p00f/nvim-ts-rainbow" })

  -- sidebar
  use({ "sidebar-nvim/sidebar.nvim",
    config = function()
      local sidebar = require("sidebar-nvim")
      local opts = {
        open = false,
        sections = { "git", "diagnostics" },
      }
      sidebar.setup(opts)
    end,
  })

  -- notify
  use({ "rcarriga/nvim-notify" })


  -- buffer
  use({ "kwkarlwang/bufresize.nvim" })

  -- asterisk
  use({ "rapan931/lasterisk.nvim",
    config = function()
      vim.keymap.set('n', '*', function() require("lasterisk").search() end)
      vim.keymap.set('n', 'g*', function() require("lasterisk").search({ is_whole = false }) end)
      vim.keymap.set('x', 'g*', function() require("lasterisk").search({ is_whole = false }) end)

      -- not support visual asterisk & is_whole = true
      -- vim.keymap.set('x', '*',  function() require("lasterisk").search() end)
    end
  })

  -- edge motion
  -- use({ "haya14busa/vim-edgemotion",
  --   config = function()
  --     local keymap = vim.api.nvim_set_keymap
  --     local opts = { noremap = true, silent = true }
  --     keymap("n", "<A-j>", "<Plug>(edgemotion-j)<cr>", opts)
  --     keymap("n", "<A-k>", "<Plug>(edgemotion-k)<cr>", opts)
  --   end })

  -- matchup
  use({ "andymass/vim-matchup",
    event = { "VimEnter" },
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  })

  -- code runner
  use({ "CRAG666/code_runner.nvim",
    filetype = {
      java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
      python = "python3 -u",
      typescript = "deno run",
      rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
    },
  })

  -- cursor move highlight

  -- use({ 'edluffy/specs.nvim',
  --   config = function()
  --     require('specs').setup {
  --       show_jumps       = true,
  --       min_jump         = 5,
  --       popup            = {
  --         delay_ms = 0, -- delay before popup displays
  --         inc_ms = 10, -- time increments used for fade/resize effects
  --         blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
  --         width = 10,
  --         winhl = "PMenu",
  --         -- fader = require('specs').linear_fader,
  --         fader = require('specs').sinus_fader,
  --         resizer = require('specs').shrink_resizer
  --       },
  --       ignore_filetypes = {},
  --       ignore_buftypes  = {
  --         nofile = true,
  --       },
  --     }
  --   end })

  use({ "stonelasley/flare.nvim",
    config = function()
      require('flare').setup {
        enabled = true, -- disable highlighting
        hl_group = "IncSearch", -- set highlight group used for highlight
        x_threshold = 5, -- column changes greater than this number trigger highlight
        y_threshold = 3, -- row changes greater than this number trigger highlight
        expanse = 4, -- highlight will expand to the left and right of cursor up to this amount (depending on space available)
        file_ignore = { -- suppress highlighting for files of this type
          "NvimTree",
          "fugitive",
          "TelescopePrompt",
          "TelescopeResult",
        },
        fade = true, -- if false will flash highlight for entire area similar to 'vim.highlight.on_yank'
        underline = false, -- if true will use more subtle underline highlight. Underline highlight can also be accomplished by setting hl_group
        timeout = 100, -- timeout delay
      }
    end })

  -- typo
  use({ 'poljar/typos.nvim',
    -- config = function() end,
  })

  -- swap
  use({ "mizlan/iswap.nvim" })

  -- SQL Uppercased
  use({ "jsborjesson/vim-uppercase-sql" })

  -- hop
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  --telescope symbols
  use({ "nvim-telescope/telescope-symbols.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
    },
  })

  -- easy-align
  -- vで選択して、markdownのテーブルを整形するため
  use({ "junegunn/vim-easy-align",
    config = function()
      local _opt = { noremap = true, silent = false }
      vim.keymap.set('v', '<leader><leader>\\', '<cmd>EasyAlign*<Bar><CR>', _opt)
    end,
  })


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
