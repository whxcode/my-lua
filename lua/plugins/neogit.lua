local M = {
  "NeogitOrg/neogit",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<CR>", desc = "Git panel" },
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({
      kind = "vsplit",
    })
  end,
}

return M
