-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

-- formatting
map({ "n", "v" }, "gq", function()
  Util.format({ force = true })
end, { desc = "Format" })

map({ "n" }, "<leader>rn", function()
  Util.format({ force = true })
end, { desc = "Format" })

--
map({ "n", "v" }, "<C-P>", "<cmd>BufferLinePick<cr>", { desc = "Picker Buffer" })
map({ "n", "v" }, ";q", "<cmd>BufferLineCloseOthers<cr>", { desc = "Picker Buffer" })
map({ "n", "v" }, "<C-q>", "<cmd>exit<cr>", { desc = "exit nvim" })

if require("lazyvim.util").has("inc-rename.nvim") then
  map({ "n" }, "<leader>rn", function()
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
  end, { desc = "rename" })
else
  map({ "n" }, "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
end
