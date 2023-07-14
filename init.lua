local utils = require("utils")

require("options")
require("autocmd")
require("keymaps")

-- we don't use plugins as root
if not utils.is_root() then
  require("lazyplug")
end


require("lualine-config")

vim.cmd [[colorscheme dracula]]

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})
