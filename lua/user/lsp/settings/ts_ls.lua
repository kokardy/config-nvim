local _M = {}

local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"

_M.init_options = {
  filetypes = { "typescript", "javascript", "vue" },
  plugins = {
    {
      name = "@vue/typescript-plugin",
      location = vue_plugin_path,
      languages = { "vue" },
    },
  },
}

return _M
