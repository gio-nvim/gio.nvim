-- TODO: autocompile with autocmds
vim.cmd "colorscheme catppuccin"
vim.g.catppuccin_flavour = "frappe"

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin").setup {
  transparent_background = false,
  term_colors = true,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.1,
  },
  styles = {
    comments = { "italic" },
    variables = {},
    keywords = {},
    functions = {},
    strings = {},
  },
  integrations = {
    telescope = true,
  },
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
  },
  custom_highlights = {
    TelescopePromptTitle = { bg = colors.sky, fg = colors.crust },
    TelescopeResultsTitle = { bg = colors.peach, fg = colors.crust },
    TelescopePreviewTitle = { bg = colors.maroon, fg = colors.crust },
  },
}
