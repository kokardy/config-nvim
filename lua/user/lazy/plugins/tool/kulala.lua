-- rest http
return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>Rs", desc = "Send request" },
    { "<leader>Ra", desc = "Send all requests" },
    { "<leader>Rb", desc = "Open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = true,
    global_keymaps_prefix = "<leader>R",
    kulala_keymaps_prefix = "",
    ui = {
      display_mode = "float", -- "float" | "split"
      win_opts = {
        wo = {
          foldmethod = "manual", -- indent | manual | expr | syntax
        }
      },
      max_response_size = 1024 * 200, -- 200 KB

    }
  },
}
