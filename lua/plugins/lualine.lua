local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    sections = {
      lualine_a = {
        {
          function()
            return "😡"
          end,
        },
      },
      lualine_c = {
        { Util.lualine.pretty_path() },
      },
      lualine_z = {},
    },
  },
}
