local cmp = require "cmp"

local function termcode(key)
    return vim.api.nvim_replace_termcodes(key, true, true, true)
end

cmp.setup {
    sources = cmp.config.sources {
        { name = "buffer" },
        { name = "luasnip" },
        { name = "path" },
    },
    snippet = {
        expand = function(args)
            require "luasnip".lsp_expand(args.body)
        end,
    },
    window = {
        completion = {
            side_padding = 0,
            winhighlight = "Normal:Pmenu,FloatBorder:CmpDocumentationBorder,CursorLine:CmpCursorLine,Search:None",
        },
        documentation = {
            border = "rounded",
            winhighlight = "FloatBorder:CmpDocumentationBorder,Search:None",
            max_width = 80,
            max_height = 12,
        },
    },
    mappings = {
        ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require "luasnip".expand_or_jumpable() then
                vim.fn.feedkeys(termcode "<Plug>luasnip-expand-or-jump", "")
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require "luasnip".jumpable(-1) then
                vim.fn.feedkeys(termcode "<Plug>luasnip-jump-prev", "")
            else
                fallback()
            end
        end)
    },
    completion = { keyword_length = 3 },
    preselect = cmp.PreselectMode.None,
    experimental = { ghost_text = true },
}
