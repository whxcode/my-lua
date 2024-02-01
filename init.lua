-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[ 

set guicursor=n-v-c:block-Cursor
set guicursor+=i:block-Cursor
set guicursor+=n-v-c:block-Cursor
set guicursor+=i:block-Cursor

autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
autocmd CursorMovedI,TextChangedI,TextChangedP * lua require'cmp.utils.autocmd'.emit('TextChanged')

set diffopt=internal,filler,closeoff,vertical

]])

vim.api.nvim_command("highlight CursorLine guibg=#333666")

-- local lspconfig = require("lspconfig")
--
-- lspconfig.ccls.setup({
--   capabilities = {
--     offsetEncoding = { "utf-16" },
--   },
-- })
