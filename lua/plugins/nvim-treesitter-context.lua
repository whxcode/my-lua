return {
  "nvim-treesitter/nvim-treesitter-context",
  init = function()
    local tsc = require("treesitter-context")

    tsc.toggle()
  end,
}
