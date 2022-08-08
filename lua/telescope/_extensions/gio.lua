local state = require "telescope.actions.state"

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local actions = require "telescope.actions"
local previewers = require "telescope.previewers"

local function modules()
  local module_path = table.concat { vim.fn.stdpath "config", vim.fn.expand "/lua/modules/" }
  local module_str = vim.fn.expand(table.concat { module_path, "*" }):gsub(module_path, ""):gsub("\\", "/")
  return vim.split(module_str, "\n")
end

local function str_definition(def)
  local lines = {}
  table.insert(lines, "Name:        " .. def.name)
  table.insert(lines, "Description: " .. def.description)
  for pkg_source, _ in pairs(def.source.packages or {}) do
    table.insert(lines, "> package:" .. pkg_source)
  end
  for scr_source, _ in pairs(def.source.scripts or {}) do
    table.insert(lines, "> script:" .. scr_source)
  end
  return lines
end

local function side_value(whole, middle)
  return math.floor((whole - middle) / 2)
end

local function adjust_padding(width, height, lines)
  local max_len = 0
  for _, line in ipairs(lines) do
    max_len = math.max(max_len, #line)
  end
  local hor_padding = side_value(width, max_len)
  for idx, line in ipairs(lines) do
    lines[idx] = string.rep(" ", hor_padding) .. line
  end

  local vert_padding = side_value(height, #lines)
  for _ = 1, vert_padding do
    table.insert(lines, 1, "")
  end

  return lines
end

local function apply_hl_on_search(hlname, search, line, linenum, bufnr)
  local spos, epos = line:find(search)
  if epos ~= nil then
    vim.api.nvim_buf_add_highlight(bufnr, 0, hlname, linenum - 1, spos - 1, epos)
    return true
  end
  return false
end

local function highlight(lines, bufnr)
  vim.api.nvim_set_hl(0, "GioTelescopeDef", { link = "TSKeyword" })
  vim.api.nvim_set_hl(0, "GioSourcePrefix", { link = "MiniTestPass" })
  for line_num, line in ipairs(lines) do
    if line ~= "" then
      local function hl_def(key)
        return apply_hl_on_search("GioTelescopeDef", key, line, line_num, bufnr)
      end
      local function hl_prefix(prefix)
        return apply_hl_on_search("GioSourcePrefix", prefix, line, line_num, bufnr)
      end
      _ = hl_def "Name:" or hl_def "Description:" or hl_prefix "script:" or hl_prefix "package:"
    end
  end
end

local function module(opts)
  opts = opts or {}
  opts = vim.tbl_deep_extend("force", opts, require("telescope._extensions")._config.gio)
  pickers
    .new(opts, {
      prompt_title = "gio.nvim",
      results_title = "modules",
      finder = finders.new_table {
        results = modules(),
      },
      sorter = require("telescope.config").values.generic_sorter(opts),
      previewer = previewers.new_buffer_previewer {
        title = "module definition",
        define_preview = function(self, entry, status)
          local definition = require("modules." .. entry.value)
          local width = vim.api.nvim_win_get_width(self.state.winid)
          local height = vim.api.nvim_win_get_height(self.state.winid)
          local lines = str_definition(definition)
          lines = adjust_padding(width, height, lines)
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, true, lines)
          highlight(lines, self.state.bufnr)
        end,
      },
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          vim.cmd(
            vim.fn.expand(
              string.format("edit %s/lua/modules/%s/init.lua", vim.fn.stdpath "config", state.get_selected_entry()[1])
            )
          )
        end)
        map("i", "<M-;>", function()
          actions.close(prompt_bufnr)
          require("telescope.builtin").find_files {
            cwd = vim.fn.expand(
              string.format("%s/lua/modules/%s/", vim.fn.stdpath "config", state.get_selected_entry()[1])
            ),
            prompt_title = "gio.nvim",
            results_title = string.format("viewing `%s` module files", state.get_selected_entry()[1]),
          }
        end)
        return true
      end,
    })
    :find()
end

return require("telescope").register_extension {
  exports = {
    module = module,
  },
}
