local hydra = require "hydra"
local function cmd(command)
    return "<cmd>" .. command .. "<cr>"
end

hydra {
    name = "Telescope",
    hint = [[
╭──────╮
│ ╭──╮°│ _f_: files      _m_: maps
│ │  │ │ _g_: grep       _/_: search in file     _<space>_: gio module
│ ╰──╯ │ _r_: resume     _h_: help
╰──────╯
^
   _<enter>_: default                                           _<esc>_ 
]],
    config = {
        color = "teal",
        invoke_on_body = true,
        hint = {
            positon = "bottom",
            border = "single",
        },
    },
    mode = "n",
    body = "<leader>t",
    heads = {
        {"f", cmd "Telescope find_files",                {descr = "Fuzzy find files"        }},
        {"g", cmd "Telescope live_grep",                 {descr = "Ripgrep a string"        }},
        {"r", cmd "Telescope resume",                    {descr = "Reopen previous picker"  }},
        {"m", cmd "Telescope keymaps",                   {descr = "View keymaps"            }},
        {"/", cmd "Telescope current_buffer_fuzzy_find", {descr = "Search in current buffer"}},
        {"h", cmd "Telescope help_tags",                 {descr = "Browse help tags"        }},
        {"<enter>", cmd "Telescope",                     {descr = "Default telescope picker"}},
        {"<space>", cmd "Gio module",                    {descr = "Gio module picker"       }},
        {"<esc>", nil,                                   {exit  = true, nowait = true       }},
    },
}

hydra {
    name = "Config dev",
    hint = [[
^
 ╭────╮ │
 │ ── │ │ _s_: save
 │ ── │ │ ──────────── _<esc>_ 
 │ ── │ │ _e_: execute
 ╰────╯ │
]],
    config = {
        color = "amaranth",
        invoke_on_body = true,
        hint = {
            position = "bottom",
            border = "single",
        },
    },
    mode = "n",
    body = "<leader>l",
    heads = {
        {"s", cmd "update" },
        {"e", cmd "source%"},
        {"<esc>", nil, {exit = true, nowait = true}},
    },
}

hydra {
    name = "gitsigns",
    hint = [[
 _d_: diff buffer  _p_: prev hunk  _u_: undo stage
 _v_: select hunk  _n_: next hunk  _r_: reset hunk
 _w_: preview hunk _s_: stage hunk _R_: reset buf
                                                   _<esc>_ 
]],
    config = {
        color = "teal",
        invoke_on_body = true,
        hint = {
            position = "bottom",
            border = "single",
        },
    },
    mode = "n",
    body = "<leader>s",
    heads = {
            { "d", cmd "Gitsigns diffthis" },
            { "v", cmd "Gitsigns select_hunk" },
            { "w", cmd "Gitsigns preview_hunk" },
            { "p", cmd "Gitsigns prev_hunk" },
            { "n", cmd "Gitsigns next_hunk" },
            { "s", cmd "Gitsigns stage_hunk" },
            { "u", cmd "Gitsigns undo_stage_hunk" },
            { "r", cmd "Gitsigns reset_hunk" },
            { "R", cmd "Gitsigns reset_buffer" },
            {"<esc>", nil, {exit = true, nowait = true}},
    },
}
