-- Wrapper around paq and lazily

-- Exported
local Manager = {
    -- Plugin configurations
    plugins = {},
    -- Packer table
    packer = {},
}

function Manager.install()
    -- Set shortcut
    local plugins = Manager.plugins
    for plugin_string, spec in pairs(plugins) do
        local module, location = unpack(vim.split(plugin_string, "@"))
        -- Just install plugin
        if vim.tbl_isempty(spec) then
            table.insert(Manager.packer, location)
        -- Install and configure it
        else
            if type(spec.config) == "string" then
                local _foo, _bar = string.find(spec.config, "@", 1, true)
                if _foo ~= nil then
                    spec.config = [[require("modules.]] .. module .. "." .. spec.config:gsub("@", "") .. [[")]]
                end
            end
            table.insert(Manager.packer, vim.tbl_extend("force", {location}, spec))
        end
    end
    require("packer").startup(function(use)
        for _, specs in pairs(Manager.packer) do
            use(specs)
        end
        use "wbthomason/packer.nvim"
    end)
end

return Manager
