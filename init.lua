local utils = require("utils")

require("options")
require("autocmd")
require("keymaps")

-- we don't use plugins as root
if not utils.is_root() then
  require("lazyplug")
end

require("lualine-config")

vim.g.spell = false
vim.g.enable_spelunker_vim = 1
vim.g.enable_spelunker_vim_on_readonly = 1
vim.g.spelunker_check_type = 2
vim.g.shell = 'zsh'
-- aeffawxfeaf

vim.cmd [[
let g:enable_spelunker_vim = 1
let g:enable_spelunker_vim = 1
let g:spelunker_check_type = 2

set nospell

nmap gx :!open <c-r><c-a><CR>
]]

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec(":SpelunkerStart", false)
    vim.api.nvim_exec(":echo 1", false)
  end,
})

require "hop".setup { keys = "etovxqpdygfblzhckisuran" }
-- place this in one of your configuration file(s)
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "t", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })



require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end
})


vim.cmd [[colorscheme dracula]]
