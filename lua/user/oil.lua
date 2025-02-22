local oil = require("oil")

oil.setup(
  {
    default_file_explore = true,
    delete_to_trash = true,
    skip_confrim_for_simple_edits = false,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == ".git" or name == ".venv" or name == "node_modules"
      end,
      win_options = {
        wrap = true,
      }
    },
    float = {
      -- Padding around the floating window
      padding = 2,
      -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      max_width = 120,
      max_height = 40,
      border = "rounded",
      win_options = {
        winblend = 1,
      },
      -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
      get_win_title = nil,
      -- preview_split: Split direction: "auto", "left", "right", "above", "below".
      preview_split = "auto",
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },

  }
)
