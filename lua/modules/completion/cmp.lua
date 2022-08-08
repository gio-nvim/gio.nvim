local cmp = require "cmp"

cmp.setup {
  sources = {
    { name = "buffer" },
    { name = "luasnip" },
    { name = "path" },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
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
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Tab>"] = cmp.mapping(function(callback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expandable() then
        require("luasnip").expand()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        callback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(_)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        vim.cmd ":<"
      end
    end),
  },
  preselect = cmp.PreselectMode.None,
  experimental = { ghost_text = true },
}
