require("github-theme").setup {
  comment_style = "italic",
  dark_float = true,
  dark_sidebar = true,
  hide_end_of_buffer = false,
  hide_inactive_statusline = false,
  keyword_style = "NONE",
  msg_area_style = "NONE",
  sidebars = { "packer" },
  theme_style = "dark_default",
}

vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "MiniStatuslineModeInsert" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "MiniStatuslineModeNormal" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "MiniStatuslineModeReplace" })
