local utils = require("utils")

require("options")
require("autocmd")
require("keymaps")

-- we don't use plugins as root
if not utils.is_root() then
  require("lazyplug")
end

require("lualine-config")
require("hop-config")
require("cmake-config")

vim.g.spell = false
vim.g.enable_spelunker_vim = 1
vim.g.enable_spelunker_vim_on_readonly = 1
vim.g.spelunker_check_type = 2
vim.g.shell = "zsh"

vim.cmd [[
let g:enable_spelunker_vim = 1
let g:enable_spelunker_vim = 1
let g:spelunker_check_type = 2

set nospell

nmap gx :!open <c-r><c-a><CR>



]]


-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   pattern = { "*" },
--   callback = function()
--     -- vim.api.nvim_exec(":SpelunkerStart", false)
--   end,
-- })



-- require("ufo").setup({
--   provider_selector = function(bufnr, filetype, buftype)
--     return { "treesitter", "indent" }
--   end
-- })


require "nvim-tree.view".View.winopts.relativenumber = true

require("lsp-file-operations").setup()


vim.cmd [[colorscheme dracula]]

console.log('1234')
