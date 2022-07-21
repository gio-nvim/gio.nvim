require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "lua",
        "vim",
        "norg",
        "query",
        "comment",
    },
    highlight = { enable = true },
    indent = { enable = true },
    playground = {
        enable = true,
        goto_node = "<CR>",
    },
}
