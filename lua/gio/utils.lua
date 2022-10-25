local Utils = {}

function Utils.highlight(spec)
  local name = spec.name spec.name = nil
  vim.api.nvim_set_hl(0, name, spec)
end

return Utils
