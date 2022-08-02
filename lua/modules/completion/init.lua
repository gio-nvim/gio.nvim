return {
    ["name"] = "Completion",
    ["description"] = "Module that sets up neovim LSP and completion",
    ["source"] = {
        ["packages"] = {
            ["hrsh7th/nvim-cmp"] = { config = "cmp" },
            ["hrsh7th/cmp-buffer"] = { after = "nvim-cmp" },
            ["hrsh7th/cmp-path"] = { after = "nvim-cmp" },
            ["saadparwaiz1/cmp_luasnip"] = { after = "nvim-cmp" },
            ["L3MON4D3/LuaSnip"] = { module = "luasnip" },
        },
    },
}
