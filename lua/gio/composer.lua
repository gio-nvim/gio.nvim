local pkgs = {}

local function edit_path(module, path, uneditable)
    if uneditable or type(path) ~= "string" then
        return path
    end
    return string.format([[require "modules.%s.%s"]], module, path)
end

local function define(definition)
    local packages = definition.source.packages
    local scripts = definition.source.scripts
    for source, config in pairs(packages) do
        config.config = edit_path(
            definition.name,
            config.config,
            config.force_default_config
        )
    config.force_default_config = nil
    config[1] = source
        table.insert(pkgs, config)
    end
end

return function(modules)
    for _, module in ipairs(modules) do
        define(require("modules." .. module))
    end
    require "packer".startup(function(use)
        use { "wbthomason/packer.nvim", opt = true }
        for _, spec in ipairs(pkgs) do
            use(spec)
        end
    end)
end
