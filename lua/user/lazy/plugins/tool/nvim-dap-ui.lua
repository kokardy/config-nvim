-- debug

local debug_pause = ""
local debug_play = ""
local debug_step_into = ""
local debug_step_over = ""
local debug_step_out = ""
local debug_step_back = ""
local debug_run_last = ""
local debug_terminate = ""

return {
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
    require("nvim-dap-virtual-text").setup()
    require("dapui").setup({
      icons = { expanded = "", collapsed = "", circular = "" },
      expand_lines = true,
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes",      size = 0.33 },
            { id = "breakpoints", size = 0.17 },
            { id = "stacks",      size = 0.25 },
            { id = "watches",     size = 0.25 },
          },
          size = 0.33,
          position = "right",
        },
        {
          elements = {
            { id = "repl",    size = 0.45 },
            { id = "console", size = 0.55 },
          },
          size = 0.27,
          position = "bottom",
        },
      },
      controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = true,
        -- Display controls in this element
        element = "repl",
        icons = {
          pause = debug_pause,
          play = debug_play,
          step_into = debug_step_into,
          step_over = debug_step_over,
          step_out = debug_step_out,
          step_back = debug_step_back,
          run_last = debug_run_last,
          terminate = debug_terminate,
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,             -- Floats will be treated as percentage of your screen.
        border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
    })

    -- python
    require("dap-python").setup("uv")

    -- dap
    local dap = require("dap")
    table.insert(dap.configurations.python,
      {
        type = 'python',
        request = 'attach',
        name = "Attach to Docker",
        connect = {
          host = "127.0.0.1", -- またはコンテナのIP
          port = 5678,
        },
        -- ここが最重要です
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(), -- ホスト側のプロジェクトルート (Neovimを開いている場所)
            remoteRoot = "/backend",     -- コンテナ内の作業ディレクトリ (DockerfileのWORKDIRなど)
          }
        },
        -- 外部ライブラリの中もステップインしたい場合は false にします
        justMyCode = true,
      }
    )
  end,
  -- dependencies必要. ないとエラーになる
  dependencies = {
    { "mortepau/codicons.nvim",          opt = true },
    { "theHamsta/nvim-dap-virtual-text", opt = true },
    { "mfussenegger/nvim-dap",           module = { "dap" } },
    { "mfussenegger/nvim-dap-python",    opt = true,        ft = { "python" } },
    { "nvim-neotest/nvim-nio",           opt = true,        ft = { "python" } },
  },
}
