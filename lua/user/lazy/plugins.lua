return {
  -- plugins
  {
    "nvim-lua/plenary.nvim",
  }, -- Useful lua functions used by lots of plugins

  {
    "windwp/nvim-autopairs",
    event = { "BufEnter" },
    config = function()
      require("user.autopairs")
    end,
    dependencies = {
      { "hrsh7th/nvim-cmp" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    wants = {
      "nvim-cmp",
      "nvim-treesitter",
    },
  }, -- Autopairs, integrates with both cmp and treesitter

  {
    "numToStr/Comment.nvim",
    event = { "VimEnter" },
    config = function()
      require("user.comment")
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    "kyazdani42/nvim-web-devicons",
  },
  {
    "kyazdani42/nvim-tree.lua",
    -- cmd = { "NvimTree*" },
    config = function()
      require("user.nvim-tree")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("user.bufferline")
    end,
  },
  {
    "moll/vim-bbye",
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("user.lualine")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = { "VimEnter" },
    config = function()
      require("user.toggleterm")
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = { "BufRead", "BufNewFile" },
  },
  {
    "lewis6991/impatient.nvim",
    config = function()
      require("user.impatient")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("user.indentline")
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("user.alpha")
    end,
  },
  {
    "folke/which-key.nvim",
    event = { "VeryLazy" },
    config = function()
      require("user.whichkey")
    end,
    opts = {
      prefix = "<leader>",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true,  -- use `nowait` when creating keymaps
    },
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
    },
  },

  -- Colorschemes
  { "lunarvim/darkplus.nvim" },
  { "folke/tokyonight.nvim", opt = true },

  -- cmp plugins
  {
    "hrsh7th/nvim-cmp",
    module = { "cmp" },
    config = function()
      require("user.cmp")
    end,
    dependencies = {
      { "hrsh7th/cmp-buffer",       event = { "InsertEnter" } },
      { "hrsh7th/cmp-path",         event = { "InsertEnter" } },
      { "hrsh7th/cmp-nvim-lsp",     event = { "InsertEnter" } },
      { "hrsh7th/cmp-nvim-lua",     event = { "InsertEnter" } },
      { "saadparwaiz1/cmp_luasnip", event = { "InsertEnter" } },
    },
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
    end,
  }, --snippet engine

  {
    "rafamadriz/friendly-snippets",
  }, -- a bunch of snippets to use

  -- LSP
  {
    "williamboman/mason.nvim",
    -- event = { "BufEnter" },
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
    },
    config = function()
      require("user.lsp")
    end,
  }, -- simple to use language server installer

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    event = { "VimEnter" },
    config = function()
      require("user.telescope")
    end,
    dependencies = {
      { "hrsh7th/nvim-cmp" },
      { "fcying/telescope-ctags-outline.nvim" },
      { "nvim-telescope/telescope-symbols.nvim" },

      -- trouble
      {
        "folke/trouble.nvim",
        opt = true,
        opts = {},
        cmd = "Trouble",
      },
    },
  },

  -- filefinder
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional. If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("user.treesitter")
    end,
  },
  {
    -- 関数名を表示
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
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
  },

  -- Git

  -- git mark
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufEnter" },
    config = function()
      require("user.gitsigns")
    end,
  },

  -- rich commit message
  { "rhysd/committia.vim" },

  -- surround
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- highlight
  { "t9md/vim-quickhl" },

  -- nerdfont
  { "lambdalisue/nerdfont.vim" },

  -- prevent from saving typo file ":w ["
  { "tyru/stoptypofile.vim" },

  -- comment
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })

      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")
    end,
  },

  -- document
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup({
        enabled = true,
        snippet_engine = "luasnip",
        languages = {
          python = {
            template = {
              annotation_convention = "google_docstrings", -- for a full list of annotation_conventions, see supported-languages below,
              --[[ annotation_convention = "numpydoc", ]]
              --[[ annotation_convention = "reST", ]]
            },
          },
        },
      })
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- yank
  {
    "gbprod/yanky.nvim",
    event = { "VimEnter" },
    dependencies = {
      { "nvim-telescope/telescope.nvim", opt = true },
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
            },
          },
          -- select = {
          --   action = nil, -- nil to use default put action
          -- },
        },
      })
      require("telescope").load_extension("yank_history")
      vim.keymap.set("n", "<leader>yr", "<cmd>Telescope yank_history<CR>")
    end,
  },

  -- trouble
  { "folke/trouble.nvim", },

  -- browser
  --[[ { "tyru/open-browser.vim" }) ]]

  -- markdown
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
    require = "godlygeek/tabular",
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = { "markdown" },
    dependencies = { { "tyru/open-browser.vim" } },
  },
  { "mattn/vim-maketable", ft = { "markdown" } },

  -- plantuml
  {
    "weirongxu/plantuml-previewer.vim",
    ft = { "plantuml" },
    dependencies = { { "tyru/open-browser.vim" } },
    wants = { "open-browser.vim" },
  },
  { "aklt/plantuml-syntax",    ft = { "plantuml" } },

  -- csv
  { "mechatroner/rainbow_csv", ft = { "csv" } },

  -- github
  {
    "pwntester/octo.nvim",
    event = { "VimEnter" },
    dependencies = {
      { "nvim-lua/plenary.nvim",         opt = true },
      { "nvim-telescope/telescope.nvim", opt = true },
      { "kyazdani42/nvim-web-devicons",  opt = true },
    },
    wants = {
      "plenary.nvim",
      "telescope.nvim",
      "nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        ssh_aliases = {
          ["github"] = "github.com",
        }, -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
      })
    end,
  },

  -- debug
  {
    "rcarriga/nvim-dap-ui",
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
    end,
    dependencies = {
      { "mortepau/codicons.nvim",          opt = true },
      { "theHamsta/nvim-dap-virtual-text", opt = true },
      { "mfussenegger/nvim-dap",           module = { "dap" } },
      { "mfussenegger/nvim-dap-python",    opt = true,        ft = { "python" } },
      { "nvim-neotest/nvim-nio",           opt = true,        ft = { "python" } },
    },
    wants = {
      "codicons.nvim",
      "nvim-dap-virtual-text",
    },
  },

  -- quickfix preview
  { "kevinhwang91/nvim-bqf" },

  -- mark
  {
    "chentoast/marks.nvim",
    config = function()
      require("user.marks").config()
    end,
  },

  -- rainbow parentheses
  { "HiPhish/rainbow-delimiters.nvim" },

  -- sidebar
  {
    "sidebar-nvim/sidebar.nvim",
    config = function()
      local sidebar = require("sidebar-nvim")
      local opts = {
        open = false,
        sections = { "git", "diagnostics" },
      }
      sidebar.setup(opts)
    end,
  },

  -- notify
  { "rcarriga/nvim-notify" },

  -- buffer
  { "kwkarlwang/bufresize.nvim" },

  -- asterisk
  {
    "rapan931/lasterisk.nvim",
    config = function()
      vim.keymap.set("n", "*", function()
        require("lasterisk").search()
      end)
      vim.keymap.set("n", "g*", function()
        require("lasterisk").search({ is_whole = false })
      end)
      vim.keymap.set("x", "g*", function()
        require("lasterisk").search({ is_whole = false })
      end)

      -- not support visual asterisk & is_whole = true
      -- vim.keymap.set('x', '*',  function() require("lasterisk").search() end)
    end,
  },

  -- matchup
  {
    "andymass/vim-matchup",
    event = { "VimEnter" },
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- code runner
  {
    "CRAG666/code_runner.nvim",
    event = { "BufEnter" },
    filetype = {
      java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
      python = "python3 -u",
      typescript = "deno run",
      rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    },
    config = function()
      require("code_runner").setup()
    end,
  },

  -- cursor move highlight

  {
    "stonelasley/flare.nvim",
    config = function()
      require("flare").setup({
        enabled = true,         -- disable highlighting
        hl_group = "IncSearch", -- set highlight group used for highlight
        x_threshold = 5,        -- column changes greater than this number trigger highlight
        y_threshold = 3,        -- row changes greater than this number trigger highlight
        expanse = 4,            -- highlight will expand to the left and right of cursor up to this amount (depending on space available)
        file_ignore = {         -- suppress highlighting for files of this type
          "NvimTree",
          "fugitive",
          "TelescopePrompt",
          "TelescopeResult",
        },
        fade = true,       -- if false will flash highlight for entire area similar to 'vim.highlight.on_yank'
        underline = false, -- if true will use more subtle underline highlight. Underline highlight can also be accomplished by setting hl_group
        timeout = 100,     -- timeout delay
      })
    end,
  },

  -- swap
  { "mizlan/iswap.nvim" },

  -- SQL Uppercased
  { "jsborjesson/vim-uppercase-sql" },

  -- SQL client nvim-dbee
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install("go")
    end,
    config = function()
      require("dbee").setup(
        {
          --[[optional config]]
          editor = {
            -- see drawer comment.
            window_options = {},
            buffer_options = {},

            -- directory where to store the scratchpads.
            --directory = "path/to/scratchpad/dir",

            -- mappings for the buffer
            mappings = {
              -- run what's currently selected on the active connection
              { key = "<leader>BB", mode = "v", action = "run_selection" },
              -- run the whole file on the active connection
              { key = "<leader>BB", mode = "n", action = "run_file" },
            },
          },
        }
      )
    end,

  },

  -- hop
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "o" },      function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  -- easy-align
  -- vで選択して、markdownのテーブルを整形するため
  {
    "junegunn/vim-easy-align",
    config = function()
      -- local _opt = { noremap = true, silent = false }
      -- vim.keymap.set("v", "<leader><leader>\\", "<cmd>EasyAlign*<Bar><CR>", _opt)
    end,
  },

  -- svelte
  { "burner/vim-svelte" },

  -- dbml
  {
    "jidn/vim-dbml",
    ft = { "dbml" },
  },

  -- trailing whitespace
  {
    "ntpeters/vim-better-whitespace",
  },

  -- github copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },

  -- markdown code block loader
  {
    "kokardy/md-codeblock-loader.nvim",
  },
}
