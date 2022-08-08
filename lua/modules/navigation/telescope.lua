local config = {
  defaults = {
    prompt_prefix = " @ ",
    selection_caret = "> ",
    file_ignore_patterns = { "node_modules", ".git", "target" },
  },
  extensions = {
    gio = require("telescope.themes").get_ivy(),
  },
  pickers = {},
}

for picker, _func in pairs(require "telescope.builtin") do
  config.pickers[picker] = {}
  config.pickers[picker].theme = "ivy"
end

require("telescope").load_extension "gio"
require("telescope").setup(config)
