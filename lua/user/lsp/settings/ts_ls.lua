local _M = {}
local vue_typescript_plugin = require("mason-registry").get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"

_M.init_options = {
  filetypes = { "typescript", "javascript", "vue" },
  plugins = {
    {
      name = "@vue/typescript-plugin",
      location = vue_typescript_plugin,
      languages = { "vue" },
    },
  },
}
