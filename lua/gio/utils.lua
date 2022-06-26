local utils = {}

function utils.tsinstall(languages)
    require("nvim-treesitter.configs").setup({
        ensure_installed = languages,
	highlight = { enable = true, },
    })
end

--- WARNING: USE THIS FUNCTION CAREFULLY
function get_config_path()
    return debug.getinfo(2, "S").source
        :sub(2)                         -- Remove @ at the start of the path
        :gsub("\\", "/")                -- Use / for path everywhere
        :gsub("/lua/gio/utils.lua", "") -- Leave only config path
end

function utils.autoload_modules()
    local path = get_config_path()
    local module_path = path.."/lua/modules/*"
    local modules = vim.split(vim.fn.expand(module_path), "\n")
    for _, module in pairs(modules) do
	module = module
	    :gsub("\\", "/")          -- use / for path
	    :gsub(vim.pesc(path), "") -- path might contain lua pattern (had this case already)
	    :gsub("/lua/", "")        -- leave only module path
	require(module)
    end
end

return utils
