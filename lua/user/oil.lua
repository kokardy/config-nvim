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
        return name == ".." or name == ".git" or name == ".venv" or name == "node_modules"
      end,
      win_options = {
        wrap = true,
      }
    }
  }
)
