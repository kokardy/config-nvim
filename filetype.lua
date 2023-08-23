local function set_filetype_based_on_first_line()
    local first_line = vim.fn.getline(1)

    if first_line:match('^openapi *:') then
        vim.bo.filetype = 'yaml.openapi'
    -- elseif first_line:match('^%%PDF') then
    --     vim.bo.filetype = 'pdf'
    -- else
    --     vim.bo.filetype = 'txt'
    -- -- 他の判定条件を追加
    end
end

-- vim.cmd([[autocmd BufReadPost * lua set_filetype_based_on_first_line()]])

vim.api.nvim_create_augroup("myFileType", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = "myFileType",
	callback = function()
    -- set_filetype_based_on_first_line()
	end,
})
