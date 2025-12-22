-- cursor move highlight
return {
  "stonelasley/flare.nvim",
  config = function()
    require("flare").setup({
      enabled = true,           -- disable highlighting
      hl_group = "IncSearch",   -- set highlight group used for highlight
      x_threshold = 5,          -- column changes greater than this number trigger highlight
      y_threshold = 3,          -- row changes greater than this number trigger highlight
      expanse = 4,              -- highlight will expand to the left and right of cursor up to this amount (depending on space available)
      file_ignore = {           -- suppress highlighting for files of this type
        "NvimTree",
        "fugitive",
        "TelescopePrompt",
        "TelescopeResult",
        "alpha",
        "copilot",
        "codecompanion",
      },
      fade = true,                   -- if false will flash highlight for entire area similar to 'vim.highlight.on_yank'
      fade_duration = 1000,          -- duration to fade highlight in milliseconds
      fade_delay = 0,                -- delay before fading in milliseconds
      fade_animate = true,           -- if false will not animate fading
      fade_animate_duration = 300,   -- duration to fade in milliseconds
      underline = true,              -- if true will use underline highlight
      -- underline             = false, -- if true will use more subtle underline highlight. Underline highlight can also be accomplished by setting hl_group
      timeout = 100,                 -- timeout delay
    })
  end,
}
