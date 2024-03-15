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
map({ "n", "v" }, "<C-P>", "<cmd>BufferLinePick<cr>")
map({ "n", "v" }, ";q", "<cmd>BufferLineCloseOthers<cr>")
map({ "n", "v" }, "<C-q>", "<cmd>exit<cr>", { desc = "exit nvim" })

if require("lazyvim.util").has("inc-rename.nvim") then
  map({ "n" }, "<leader>rn", function()
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
  end, { desc = "rename" })
else
  map({ "n" }, "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
end

map({ "n" }, "<leader>gg", "")

map({ "n", "v" }, ",ci", "<cmd>ClangdToggleInlayHints<cr>", { desc = "ClangdToggleInlayHints" })
map({ "n", "v" }, ",ca", "<cmd>ClangdAST<cr>", { desc = "ClangdAST" })
map({ "n", "v" }, ",ch", "<cmd>ClangdTypeHierarchy<cr>", { desc = "ClangdTypeHierarchy" })
map({ "n", "v" }, ",cr", "<cmd>CMakeRun<cr>", { desc = "CMakeRun" })

-- Move current line down
map("n", "<C-,>", ":m .+1<CR>", { noremap = true, silent = true })

-- Move current line up
map("n", "<C-.>", ":m .-2<CR>", { noremap = true, silent = true })

-- 定义一个函数来执行 make 命令并发送通知
local function make_uikit()
  --local result = vim.fn.system("echo pwd")
  -- require("notify")("UIKit compilation finished", "info")
end

-- 定义一个自定义命令

map({ "n", "v" }, ",cu", function()
  -- 保存当前工作目录
  local current_dir = vim.fn.getcwd()

  -- 改变工作目录到你的项目目录
  vim.fn.chdir("~/webProject/mk-app/modules/uikit")

  -- 执行 make 命令
  local result = vim.fn.system("make uikit")

  -- 恢复原来的工作目录
  vim.fn.chdir(current_dir)

  -- 发送通知
  require("notify")("UIKit compilation finished", "info")
end, { desc = "make uikit" })
