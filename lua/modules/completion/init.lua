return {
  ["name"] = "Completion",
  ["description"] = "Module that sets up neovim LSP and completion",
  ["source"] = {
    ["packages"] = {
      ["hrsh7th/nvim-cmp"] = { config = "cmp" },
      ["hrsh7th/cmp-buffer"] = {},
      ["hrsh7th/cmp-path"] = {},
      ["hrsh7th/cmp-nvim-lsp"] = {},
      ["saadparwaiz1/cmp_luasnip"] = {},
      ["L3MON4D3/LuaSnip"] = { module = "luasnip" },
      ["neovim/nvim-lspconfig"] = { config = "lspconfig" },
    },
  },
}
