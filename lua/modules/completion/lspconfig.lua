local configs = require "lspconfig"

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local function on_attach()
  local function nmap(args)
    vim.keymap.set("n", args[1], args[2], { buffer = true })
  end
  nmap { "K", vim.lsp.buf.hover }
  nmap { "gd", vim.lsp.buf.definition }
  nmap { "gD", vim.lsp.buf.declaration }
  nmap { "[d", vim.diagnostic.goto_next }
  nmap { "]d", vim.diagnostic.goto_prev }
  nmap { "<leader>ca", vim.lsp.buf.code_action }
  nmap { "<leader>Q", vim.diagnostic.setqflist }
end

configs["zls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

configs["rust_analyzer"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
