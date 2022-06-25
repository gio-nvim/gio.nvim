-- Wrapper around paq and lazily

-- Setup lazily
local lazily = require("lazily")
lazily.setup({
    load = lazily.packadd -- works with paq.nvim
})

-- Exported
local Manager = {
    -- Plugin configurations
    plugins = {},
    -- Paq table
    paq = {},
}

function Manager.install()
    -- Fetch plugin table
    local plugins = Manager.plugins
    for plugin_string, plugin_config in pairs(plugins) do
        -- Parse keyname
        local module, owner, name = unpack(vim.split(plugin_string, "/"))
        -- Set paq plugin table
        table.insert(Manager.paq, vim.tbl_extend("force", {owner .. "/" .. name}, plugin_config.options))
        -- Fetch alias
        local alias = plugin_config.options.as
        -- Rename plugin if alias is found
        name = alias and alias or name
        -- Use lazily
        lazily.use(name, plugin_config.lazy_load)
        -- TODO: do sth with config
    end
    require("paq")(Manager.paq)
end

Manager.install()

return Manager
