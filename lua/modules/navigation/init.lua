return {
  ["name"] = "Navigation",
  ["description"] = "Module that adds navigation plugins",
  ["source"] = {
    ["packages"] = {
      ["nvim-telescope/telescope.nvim"] = {
        config = "telescope",
        branch = "0.1.x",
        requires = "nvim-lua/plenary.nvim",
        cmd = "Telescope",
        module_pattern = "telescope",
      },
      ["kylechui/nvim-surround"] = { config = "surround" },
    },
  },
}
