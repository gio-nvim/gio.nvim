return {
  ["name"] = "Colors",
  ["description"] = "Module that manages highlights-related stuff",
  ["source"] = {
    ["packages"] = {
      --["catppuccin/nvim"] = { as = "catppuccin", config = "catppuccin" },
      ["projekt0n/github-nvim-theme"] = { config = "github" },
      ["nvim-treesitter/nvim-treesitter"] = {
        config = "parsers",
        event = "BufEnter",
      },
      ["nvim-treesitter/playground"] = { after = "nvim-treesitter" },
    },
  },
}
