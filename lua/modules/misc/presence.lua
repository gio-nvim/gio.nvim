require "presence":setup({
    -- General options
    auto_update         = true,
    neovim_image_text   = "vscode is bloated btw",
    main_image          = "file",
    client_id           = "793271441293967371",
    log_level           = nil,
    debounce_timeout    = 5,
    enable_line_number  = true,
    blacklist           = {},
    buttons             = function(buffer, repo_url)
        local buttons = {}
        table.insert(buttons, {
            label = "Check out my config!",
            url   = "https://github.com/gio-nvim/gio.nvim",
        })
        return buttons
    end,
    file_assets         = {},

    -- Rich Presence text options
    editing_text        = "editing %s",
    file_explorer_text  = "browsing files with %s",
    git_commit_text     = "committing",
    plugin_manager_text = "managing plugins in %s",
    reading_text        = "reading %s",
    workspace_text      = "working on %s",
    line_number_text    = "%s/%s",
})
