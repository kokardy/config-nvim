-- yank
return {
  "gbprod/yanky.nvim",
  event = { "VimEnter" },
  dependencies = {
    { "nvim-telescope/telescope.nvim", opt = true },
  },
  config = function()
    -- local utils = require("yanky.utils")
    local mapping = require("yanky.telescope.mapping")
    require("yanky").setup({
      picker = {
        telescope = {
          mappings = {
            default = mapping.put("p"),
            i = {
              ["C-p"] = mapping.put("p"),
              -- ["S-P"] = mapping.put("P"),
              -- [your keymap] = mapping.delete(),
              -- [your keymap] = mapping.set_register(utils.get_default_register()),
            },
            -- n = {
            --   [your keymap] = mapping.put("p"),
            --   [your keymap] = mapping.put("P"),
            --   [your keymap] = mapping.delete(),
            --   [your keymap] = mapping.set_register(utils.get_default_register())
            -- },
          },
        },
        -- select = {
        --   action = nil, -- nil to use default put action
        -- },
      },
    })
    require("telescope").load_extension("yank_history")
    vim.keymap.set("n", "<leader>yr", "<cmd>Telescope yank_history<CR>")
  end,
}
