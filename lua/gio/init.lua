--- THIS CODE IS NOT INTENDED TO BE CONFIGURED BY USER
require "gio.plugin.ensure"

local exports = {
    utils = require "gio.utils",
    tsinstall = require("gio.utils").tsinstall,
    plug = require("gio.plugin.manager").install,
    load_modules = require("gio.utils").autoload_modules
}
return exports
