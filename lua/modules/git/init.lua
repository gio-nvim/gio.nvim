return {
    ["name"] = "Git",
    ["description"] = "Module that helps you to interact with git",
    ["source"] = {
        ["packages"] = {
            ["lewis6991/gitsigns.nvim"] = {
                config = "gitsigns",
                cond = function()
                    return vim.fn.expand(".git/*") ~= ""
                end,
            }
        },
    },
}
