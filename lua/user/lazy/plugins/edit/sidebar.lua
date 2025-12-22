-- sidebar
return {
  "sidebar-nvim/sidebar.nvim",
  opts = {
    open = false,
    sections = { "git", "diagnostics" },
  },
  event = { "BufRead" },
}
