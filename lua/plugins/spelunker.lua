local M = {
  url = "https://github.com/kamykn/spelunker.vim",
  cmd = { "SpelunkerAddAll", "SpelunkerStart" },
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd([[
    " 拼写检查快捷键
    silent! nmap <unique> [z <Plug>(spelunker-jump-next)
    silent! nmap <unique> ]z <Plug>(spelunker-jump-prev)
    ]])
  end,
}

return M
