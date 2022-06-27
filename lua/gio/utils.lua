--- AUTOGENERATED FROM gio.norg
local utils = {}
function utils.tsinstall(languages)
    require("nvim-treesitter.configs").setup({
        ensure_installed = languages,
        highlight = { enable = true, },
    })
end
function get_config_path()
    return debug.getinfo(2, "S").source
    :sub(2)
    :gsub("\\", "/")
    :gsub("/lua/gio/utils.lua", "")
end
function utils.autoload_modules()
    local path = get_config_path()
    local module_path = path.."/lua/modules/*"
    local modules = vim.split(vim.fn.expand(module_path), "\n")
    for _, module in pairs(modules) do
        module = module
        :gsub("\\", "/")
        :gsub(vim.pesc(path), "")
        :gsub("/lua/", "")
        require(module)
    end
end
function utils.set(opt)
    if type(opt) == "string" then
        if opt:sub(1, 2) == "no" then
            vim.opt[opt:sub(3)] = false
        else
            vim.opt[opt] = true
        end
    else
        if vim.tbl_islist(opt) then
            for _, option in ipairs(opt) do
                if option:sub(1, 2) == "no" then
                    vim.opt[option:sub(3)] = false
                else
                    vim.opt[option] = true
                end
            end
        else
            for key, value in pairs(opt) do
                vim.opt[key] = value
            end
        end
    end
end
return utils