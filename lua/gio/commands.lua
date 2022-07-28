-- TODO: create custom telescope picker
local subcommands = {}

local function telescope_installed()
    local installed, _ = pcall(require, "telescope")
    return installed
end

function subcommands.module(modulename)
    if modulename == nil then
        if telescope_installed() then
            require "telescope".extensions.gio.module()
        else
            print "Please provide module name!"
            print "Hit <Tab> for autocomplete!"
        end
        return
    end
    vim.cmd(vim.fn.expand("edit " .. vim.fn.stdpath "config" .. "/lua/modules/" .. modulename .. "/init.lua"))
end

local function Gio(arguments)
    local subcommand = arguments.fargs[1]
    local subfunction = subcommands[subcommand]
    if subfunction == nil then
        print "Invalid subcommand! please provide one of the following:"
        local substring = ""
        for subcommand_name, _ in pairs(subcommands) do
            substring = substring .. "- " .. subcommand_name .. "\n"
        end
        print(substring)
    end
    if subcommand == "module" then
        subfunction(arguments.fargs[2])
    end
end

local function GioComplete(arglead, cmdline, curpos)
    local cmd = vim.split(vim.trim(cmdline), " ")
    local subcommand = cmd[2]
    if subcommand == "module" then
        local module_path = table.concat({vim.fn.stdpath "config", vim.fn.expand "/lua/modules/"})
        local module_str = vim.fn.expand(table.concat({module_path, "*"})):gsub(module_path, ""):gsub("\\", "/")
        return vim.split(module_str, "\n")
    end
    return { "module" }
end

vim.api.nvim_create_user_command("Gio", Gio, { nargs = "+", desc = "Gio management command", complete = GioComplete })
