local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {}

local mappings = {
  { "<leader>C",  group = "Code Companion",                 nowait = true,                        remap = false },
  { "<leader>Cc", "<cmd>CodeCompanionChat toggle<cr>",      desc = "Code Companion Chat toggle",  nowait = true, remap = false },
  { "<leader>Cn", "<cmd>CodeCompanionChat<cr>",             desc = "Code Companion Chat new",     nowait = true, remap = false },
  { "<leader>Ca", "<cmd>CodeCompanionActions<cr>",          desc = "Code Companion Chat Actions", nowait = true, remap = false },

  { "<leader>F",  "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text",                   nowait = true, remap = false },
  {
    "<leader>P",
    "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
    desc = "Projects",
    nowait = true,
    remap = false,
  },
  { "<leader>S",  group = "Sidebar",            nowait = true,          remap = false },
  { "<leader>St", "<cmd>SidebarNvimToggle<cr>", desc = "SidebarToggle", nowait = true, remap = false },
  { "<leader>a",  "<cmd>Alpha<cr>",             desc = "Alpha",         nowait = true, remap = false },
  {
    "<leader>b",
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    desc = "Buffers",
    nowait = true,
    remap = false,
  },
  { "<leader>d",  group = "Debug",                             nowait = true,          remap = false },
  { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor", nowait = true, remap = false },
  { "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>",      desc = "Toggle UI",     nowait = true, remap = false },
  { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>",     desc = "Step Back",     nowait = true, remap = false },
  { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",      desc = "Continue",      nowait = true, remap = false },
  { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>",    desc = "Disconnect",    nowait = true, remap = false },
  { "<leader>dg", "<cmd>lua require'dap'.session()<cr>",       desc = "Get Session",   nowait = true, remap = false },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",     desc = "Step Into",     nowait = true, remap = false },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",     desc = "Step Over",     nowait = true, remap = false },
  { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>",         desc = "Pause",         nowait = true, remap = false },
  { "<leader>dq", "<cmd>lua require'dap'.close()<cr>",         desc = "Quit",          nowait = true, remap = false },
  { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>",   desc = "Toggle Repl",   nowait = true, remap = false },
  { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>",      desc = "Start",         nowait = true, remap = false },
  {
    "<leader>dt",
    "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
    desc = "Toggle Breakpoint",
    nowait = true,
    remap = false,
  },
  { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>",     desc = "Step Out",  nowait = true, remap = false },
  {
    "<leader>dv",
    "<cmd>lua require('dapui').eval()<CR>",
    desc = "view hovered variable",
    nowait = true,
    remap = false,
  },
  { "<leader>e",  "<cmd>lua require'oil'.toggle_float()<cr>", desc = "File Tree", nowait = true, remap = false },
  {
    "<leader>f",
    "<cmd>lua require('telescope').extensions.smart_open.smart_open()<cr>",
    desc = "Find files",
    nowait = true,
    remap = false,
  },
  { "<leader>g",  group = "Git",                                  nowait = true,              remap = false },
  {
    "<leader>gR",
    "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
    desc = "Reset Buffer",
    nowait = true,
    remap = false,
  },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>",              desc = "Checkout branch",   nowait = true, remap = false },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>",               desc = "Checkout commit",   nowait = true, remap = false },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",              desc = "Diff",              nowait = true, remap = false },
  { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",               desc = "Lazygit",           nowait = true, remap = false },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",  desc = "Next Hunk",         nowait = true, remap = false },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",  desc = "Prev Hunk",         nowait = true, remap = false },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame",             nowait = true, remap = false },
  { "<leader>go", "<cmd>Telescope git_status<cr>",                desc = "Open changed file", nowait = true, remap = false },
  {
    "<leader>gp",
    "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
    desc = "Preview Hunk",
    nowait = true,
    remap = false,
  },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
  {
    "<leader>gu",
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    desc = "Undo Stage Hunk",
    nowait = true,
    remap = false,
  },
  { "<leader>l",  group = "LSP",             nowait = true,           remap = false },
  { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
  {
    "<leader>lS",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    desc = "Workspace Symbols",
    nowait = true,
    remap = false,
  },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",      desc = "Code Action",     nowait = true, remap = false },
  {
    "<leader>ld",
    "<cmd>Telescope lsp_document_diagnostics<cr>",
    desc = "Document Diagnostics",
    nowait = true,
    remap = false,
  },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format",          nowait = true, remap = false },
  { "<leader>li", "<cmd>LspInfo<cr>",                            desc = "Info",            nowait = true, remap = false },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>",     desc = "Next Diagnostic", nowait = true, remap = false },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",     desc = "Prev Diagnostic", nowait = true, remap = false },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",         desc = "CodeLens Action", nowait = true, remap = false },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",    desc = "Quickfix",        nowait = true, remap = false },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",           desc = "Rename",          nowait = true, remap = false },
  {
    "<leader>ls",
    "<cmd>Telescope lsp_document_symbols<cr>",
    desc = "Document Symbols",
    nowait = true,
    remap = false,
  },
  {
    "<leader>lw",
    "<cmd>Telescope lsp_workspace_diagnostics<cr>",
    desc = "Workspace Diagnostics",
    nowait = true,
    remap = false,
  },
  { "<leader>n",  group = "Neogen",                           nowait = true,             remap = false },
  { "<leader>nc", "<cmd>Neogen class<cr>",                    desc = "Neogen class",     nowait = true, remap = false },
  { "<leader>nf", "<cmd>Neogen func<cr>",                     desc = "Neogen func",      nowait = true, remap = false },
  { "<leader>nn", "<cmd>Neogen<cr>",                          desc = "Neogen",           nowait = true, remap = false },
  { "<leader>nt", "<cmd>Neogen type<cr>",                     desc = "Neogen type",      nowait = true, remap = false },
  { "<leader>o",  "<cmd>AerialToggle!<CR>",                   desc = "Toggle outline",   nowait = true, remap = false },
  { "<leader>q",  "<cmd>q!<CR>",                              desc = "Quit",             nowait = true, remap = false },
  { "<leader>r",  group = "Code Runner",                      nowait = true,             remap = false },
  { "<leader>rc", "<cmd>RunClose<cr>",                        desc = "Run close",        nowait = true, remap = false },
  { "<leader>rf", "<cmd>RunFile<cr>",                         desc = "Run file",         nowait = true, remap = false },
  { "<leader>rp", "<cmd>RunProject<cr>",                      desc = "Run project",      nowait = true, remap = false },
  { "<leader>rr", "<cmd>RunCode<cr>",                         desc = "Run code",         nowait = true, remap = false },
  { "<leader>rt", "<cmd>RunFile tab<cr>",                     desc = "Run file tab",     nowait = true, remap = false },
  { "<leader>s",  group = "Search",                           nowait = true,             remap = false },
  { "<leader>sC", "<cmd>Telescope commands<cr>",              desc = "Commands",         nowait = true, remap = false },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>",             desc = "Man Pages",        nowait = true, remap = false },
  { "<leader>sR", "<cmd>Telescope registers<cr>",             desc = "Registers",        nowait = true, remap = false },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>",          desc = "Checkout branch",  nowait = true, remap = false },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>",           desc = "Colorscheme",      nowait = true, remap = false },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>",             desc = "Find Help",        nowait = true, remap = false },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>",               desc = "Keymaps",          nowait = true, remap = false },
  { "<leader>sm", "<cmd>Telescope marks<cr>",                 desc = "Marks",            nowait = true, remap = false },
  { "<leader>so", "<cmd>Telescope ctags_outline outline<cr>", desc = "Outline",          nowait = true, remap = false },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>",              desc = "Open Recent File", nowait = true, remap = false },
  { "<leader>ss", "<cmd>Telescope symbols<cr>",               desc = "Symbols",          nowait = true, remap = false },
  { "<leader>t",  group = "Terminal",                         nowait = true,             remap = false },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",      desc = "Float",            nowait = true, remap = false },
  {
    "<leader>th",
    "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
    desc = "Horizontal",
    nowait = true,
    remap = false,
  },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>",                      desc = "Node",                nowait = true, remap = false },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>",                    desc = "Python",              nowait = true, remap = false },
  { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>",                      desc = "Htop",                nowait = true, remap = false },
  { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>",                      desc = "NCDU",                nowait = true, remap = false },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",   desc = "Vertical",            nowait = true, remap = false },
  { "<leader>w",  "<cmd>w!<CR>",                                      desc = "Save",                nowait = true, remap = false },
  { "<leader>y",  group = "Yank",                                     nowait = true,                remap = false },
  { "<leader>ya", 'ggVG"+y',                                          desc = "yank all",            nowait = true, remap = false },
  { "<leader>yh", "<cmd>Telescope yank_history<cr>",                  desc = "yanky history",       nowait = true, remap = false },
  { "<leader>yr", "<cmd>YankyRingHistory<cr>",                        desc = "yanky ring history",  nowait = true, remap = false },
  { "<leader>T",  group = "Trouble",                                  nowait = true,                remap = false },
  { "<leader>Td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble diagnostics", nowait = true, remap = false },
  { "<leader>Ts", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Trouble symbols",     nowait = true, remap = false },
}

which_key.add(mappings, opts)
