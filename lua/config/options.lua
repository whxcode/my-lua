local opt = vim.opt

opt.mouse = "nv" -- Disable mouse in command-line mode
opt.shell = "zsh" -- Disable mouse in command-line mode

opt.history = 5000

opt.signcolumn = "no"

opt.scrolloff = 10
opt.sidescrolloff = 10

-- Undo
opt.undofile = true
opt.undolevels = 10000
opt.writebackup = false

-- If sudo, disable vim swap/backup/undo/shada writing
local USER = vim.env.USER or ""
local SUDO_USER = vim.env.SUDO_USER or ""
if
  SUDO_USER ~= ""
  and USER ~= SUDO_USER
  and vim.env.HOME ~= vim.fn.expand("~" .. USER, true)
  and vim.env.HOME == vim.fn.expand("~" .. SUDO_USER, true)
then
  vim.opt_global.modeline = false
  vim.opt_global.undofile = false
  vim.opt_global.swapfile = false
  vim.opt_global.backup = false
  vim.opt_global.writebackup = false
  vim.opt_global.shadafile = "NONE"
end