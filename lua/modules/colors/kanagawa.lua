vim.cmd.colorscheme "kanagawa"

local kanagawa_colors = require "kanagawa.colors".setup()
local hig = require "gio".utils.highlight

hig {
  name = "TelescopePromptTitle",
  bg = kanagawa_colors.roninYellow,
  fg = kanagawa_colors.sumiInk1,
}

hig {
  name = "TelescopeResultsTitle",
  bg = kanagawa_colors.waveRed,
  fg = kanagawa_colors.sumiInk1,
}

hig {
  name = "TelescopePreviewTitle",
  bg = kanagawa_colors.oniViolet,
  fg = kanagawa_colors.sumiInk1,
}

hig {
  name = "GioTelescopeDefinition",
  fg = kanagawa_colors.waveRed,
}

hig {
  name = "GioSourcePrefix",
  fg = kanagawa_colors.oniViolet,
}
