return {
    ["name"] = "Colors",
    ["description"] = "Module that manages highlights-related stuff",
    ["source"] = {
        ["packages"] = {
            ["kvrohit/rasmus.nvim"] = { config = "theme" },
            ["nvim-treesitter/nvim-treesitter"] = {
                config = "parsers",
                event = "BufEnter"
            },
            ["nvim-treesitter/playground"] = { after = "nvim-treesitter" },
        },
    }
}
