-- rest http
local function copy_curl_command()
  local mode = vim.fn.mode()
  local lines, row
  if mode == "v" or mode == "V" or mode == "\22" then
    local start_line = math.min(vim.fn.line("v"), vim.fn.line("."))
    local end_line = math.max(vim.fn.line("v"), vim.fn.line("."))
    lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    row = 1
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
  else
    lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
    row = vim.api.nvim_win_get_cursor(0)[1]
  end

  local result = require("resty.parser").parse(lines, row)
  if require("resty.diagnostic").check_errors(0, result) then
    return
  end

  local req = vim.tbl_deep_extend("force", {}, result.request, { dry_run = true })
  local raw_args = require("plenary.curl").request(req.url, req)

  local cmd_parts = { "curl" }
  local i = 1
  while i <= #raw_args do
    local arg = raw_args[i]
    if arg == "-D" then
      i = i + 2
    else
      if arg:match("^[%w%-%._/]+$") then
        table.insert(cmd_parts, arg)
      else
        table.insert(cmd_parts, vim.fn.shellescape(arg))
      end
      i = i + 1
    end
  end

  local cmd = table.concat(cmd_parts, " ")
  vim.fn.setreg("+", cmd)
  vim.fn.setreg('"', cmd)
  vim.notify("Copied curl command:\n" .. cmd, vim.log.levels.INFO)
end

return {
  "lima1909/resty.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    vim.filetype.add({
      extension = {
        http = "http",
        resty = "resty",
      },
    })
  end,
  ft = { "http", "resty" },
  cmd = { "Resty" },
  keys = {
    { "<leader>Rs", ":Resty run<CR>", mode = { "n", "v" }, desc = "Resty: Run request" },
    { "<leader>Rl", "<cmd>Resty last<CR>", desc = "Resty: Run last request" },
    { "<leader>Rf", "<cmd>Resty favorite<CR>", desc = "Resty: View favorites" },
    { "<leader>Rc", copy_curl_command, mode = { "n", "v" }, desc = "Resty: Copy curl command" },
  },
  opts = {},
}
