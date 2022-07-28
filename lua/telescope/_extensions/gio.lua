local state = require "telescope.actions.state"

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local actions = require "telescope.actions"

local function modules()
    local module_path = table.concat({vim.fn.stdpath "config", vim.fn.expand "/lua/modules/"})
    local module_str = vim.fn.expand(table.concat({module_path, "*"})):gsub(module_path, ""):gsub("\\", "/")
    return vim.split(module_str, "\n")
end

local function module(opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", opts, require "telescope._extensions"._config.gio)
    pickers.new(opts, {
        prompt_title = "gio.nvim",
        results_title = "modules",
        finder = finders.new_table({
            results = modules()
        }),
        sorter = require "telescope.config".values.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                vim.cmd(vim.fn.expand(string.format("%s/modules/%s/init.lua",
                    vim.fn.stdpath "config",
                    state.get_selected_entry()[1]
                )))
            end)
            return true
        end
    }):find()
end

return require "telescope".register_extension {
    exports = {
        module = module,
    }
}

