local M = {}
local utf8 = require("submodules.utf8.lua.utf8")
local debug_pause = utf8.char(0xead1)
local debug_play = utf8.char(0xead3)
local debug_step_into = utf8.char(0xead4)
local debug_step_over = utf8.char(0xead6)
local debug_step_out = utf8.char(0xead5)
local debug_step_back = utf8.char(0xeb8f)
local debug_run_last = utf8.char(0xfb00)
local debug_terminate = utf8.char(0xead7)

M.setup = function()
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
          { id = "scopes", size = 0.33 },
          { id = "breakpoints", size = 0.17 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.25 },
        },
        size = 0.33,
        position = "right",
      },
      {
        elements = {
          { id = "repl", size = 0.45 },
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
      max_width = 0.5, -- Floats will be treated as percentage of your screen.
      border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
  })
  require("user.dap.python")
end

return M
