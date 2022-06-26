require("gio.plugin.manager").plugins["organization@nvim-neorg/neorg"] = {
    config = "@neorg",
    event = { "BufRead", "BufNewFile" },
    requires = {"nvim-treesitter"},
}
