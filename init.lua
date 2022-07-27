local PACK_PATH = vim.fn.stdpath "data" .. "/site/pack"

local function ensure(repo, kind)
    kind = kind or "opt"
    local name = vim.split(repo, "/")[2]
    local destination = string.format(
        "%s/packer/%s/%s", PACK_PATH, kind, name
    )

    if vim.fn.empty(vim.fn.glob(destination)) > 0 then
        vim.notify("GIO: auto-installing " .. repo .. "...")
        vim.fn.system {
            "git", "clone", "--depth", "1",
            "https://github.com/" .. repo, destination,
        }
        if vim.v.shell_error ~= 0 then
            vim.notify("GIO: failed to install " .. repo .. "...", vim.log.levels.ERROR)
        else
            vim.notify("GIO: installed " .. repo .. "!")
        end
    end
end

local function is_installed(name, kind)
    kind = kind or "opt"
    return vim.fn.empty(vim.fn.glob(string.format("%s/packer/%s/%s", PACK_PATH, kind, name))) == 0
end

vim.opt.loadplugins = false
vim.opt.shadafile = "NONE"

vim.api.nvim_command "syntax off"
vim.api.nvim_command "filetype off"
vim.api.nvim_command "filetype plugin indent off"

vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

pcall(require, "modules.colors.github")

vim.defer_fn(function()
    vim.api.nvim_command "runtime! plugin/**/*.vim"
    vim.api.nvim_command "runtime! plugin/**/*.lua"

    vim.api.nvim_command "syntax on"
    vim.api.nvim_command "filetype on"
    vim.api.nvim_command "filetype plugin indent on"

    ensure "wbthomason/packer.nvim"

    vim.api.nvim_command "packadd packer.nvim"
    require "composer"
    vim.api.nvim_exec_autocmds("BufEnter", {})
end, 0)

