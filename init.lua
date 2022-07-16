local PACK_PATH = vim.fn.stdpath("data") .. "/site/pack"

local function ensure(repository, kind)
    kind = kind or "opt"
    local name = vim.split(repository, "/")[2]
    local destination = string.format(
        "%s/packer/%s/%s", PACK_PATH, kind, name
    )
    if vim.fn.empty(vim.fn.glob(destination)) > 0 then
        vim.notify("GIO: auto-installing " .. repository .. "...")
        vim.fn.system({
            "git", "clone", "--depth", "1",
            "https://github.com/" .. repository, destination,
        })
        if vim.v.shell_error ~= 0 then
            vim.notify(
                "GIO: failed to auto-install " .. repository .. "...",
                vim.log.levels.ERROR
            )
        else
            vim.notify("GIO: auto-installed " .. repository .. "...")
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

vim.defer_fn(function()
    vim.api.nvim_command "runtime! plugin/**/*.vim"
    vim.api.nvim_command "runtim! plugin/**/*.lua"

    vim.api.nvim_command "syntax on"
    vim.api.nvim_command "filetype on"
    vim.api.nvim_command "filetype plugin indent on"

    ensure "wbthomason/packer.nvim"
    ensure "rktjmp/hotpot.nvim"

    vim.api.nvim_command "packadd hotpot.nvim"
    vim.api.nvim_command "packadd packer.nvim"

    require "hotpot".setup {}
    local ok, value pcall(require, "composer")
    if not ok then
        require "gio.composer".generate()
	require "gio.composer".compose(require "composer")
    end
end, 0)
