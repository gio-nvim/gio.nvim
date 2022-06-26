require("gio.plugin.manager").plugins["colors@nvim-treesitter/nvim-treesitter"] = {
    config = "@treesitter",
    event = { "BufRead", "BufNewFile" },
}
