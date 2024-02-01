local Util = require("lazyvim.util")

local current_signature = function()
  if not pcall(require, "lsp_signature") then
    return
  end
  local sig = require("lsp_signature").status_line(20)
  return sig.label .. sig.hint
end

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
        {
          Util.lualine.pretty_path(),
        },
        {
          current_signature,
        },
        {

          "navic",

          -- Component specific options
          color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
          -- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
          -- Setting it to "static" will perform a adjustment once when the component is being setup. This should
          --   be enough when the lualine section isn't changing colors based on the mode.
          -- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
          --   the current section.

          navic_opts = nil, -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
        },
      },
      lualine_b = {},
    },
  },
}
