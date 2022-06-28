require("gio.plugin.manager").plugins["colors@nvim-treesitter/nvim-treesitter"] = {
    config = "@treesitter",
    event = { "BufRead", "BufNewFile" },
}

require("gio.plugin.manager").plugins["colors@catppuccin/nvim"] = {
    as = "catppuccin",
    config = "@theme",
}
