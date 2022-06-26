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

local function config_format(config, module)
    if type(config) == "string" then
        config = string.format("modules.%s.%s", module, config)
    end
    return config
end

local function config_call(config)
    if type(config) == "string" then
        require(config)
    else
        config()
    end
end

function Manager.install()
    -- Fetch plugin table
    local plugins = Manager.plugins
    for plugin_string, pconfig in pairs(plugins) do
        -- Parse keyname
        local module, owner, name = unpack(vim.split(plugin_string, "/"))

        if vim.tbl_isempty(pconfig) then
            table.insert(Manager.paq, owner.."/"..name)
            break
        end

        -- Fetch alias
        local alias = pconfig.options.as
        -- Rename plugin if alias is found
        name = alias and alias or name

        -- Format config
        local fconfig = config_format(pconfig.config, module)

        -- If lazily config is present
        if pconfig.lazy ~= nil and not vim.tbl_isempty(pconfig.lazy) then
            pconfig.lazy_load.config = fconfig  -- assign formatted config to lazily config
            lazily.use(name, pconfig.lazy_load) -- setup plugin with lazily
            pconfig.options.opt = true          -- set plugin as opt in paq
        else
            config_call(fconfig) -- just call plugin config
        end

        -- Set paq plugin table (append {"owner/name", ....})
        table.insert(Manager.paq, vim.tbl_extend("force", {owner .. "/" .. name}, pconfig.options))
    end
    require("paq")(Manager.paq)
end

return Manager
