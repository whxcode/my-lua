local M = {
  "lewisj991/gitsigns.nvim",
  -- "VeryLazy" hides splash screen
  cmd = { "Gitsigns" }
}

M.config = function()
  require("gitsigns").setup()
end

return M
