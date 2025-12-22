local config_path = vim.fn.stdpath("config")
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.cmd(
      [[
        function! OpenMarkdownPreview(url)
            execute "silent ! brave-browser --incognito " . a:url
        endfunction
        let g:mkdp_browserfunc = 'OpenMarkdownPreview'
      ]],
      false
    )
    vim.g.mkdp_filetypes = { "markdown", "plantuml" }
    vim.g.mkdp_markdown_css = config_path .. "/mkdp_markdown.css"
    -- vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    -- vim.g.mkdp_refresh_slow = 1
    -- vim.g.mkdp_open_to_the_world = 1
  end,
  ft = { "markdown", "plantuml" },
}
