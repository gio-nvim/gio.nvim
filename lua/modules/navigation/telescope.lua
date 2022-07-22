local config = {}
config.defaults = {
    prompt_prefix = " @ ",
    selection_caret =  "> ",
    file_ignore_patterns = { "node_modules", ".git", "target" },
}
config.pickers = {}

for picker, _func in pairs(require "telescope.builtin") do
    config.pickers[picker] = {}
    config.pickers[picker].theme = "ivy"
end

require "telescope".setup(config)
