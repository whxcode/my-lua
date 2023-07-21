local M = {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
}

M.init = function()
  vim.keymap.set("", "<leader>t", "<Esc>:NvimTreeToggle<CR>", { silent = true })
  vim.keymap.set("", "<leader>ef", "<Esc>:NvimTreeFindFileToggle<CR>", { silent = true })
end

M.config = function()
  require "nvim-tree".setup {

  }
end

return M
