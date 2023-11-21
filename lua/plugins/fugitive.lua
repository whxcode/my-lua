return {
  "tpope/vim-fugitive",
  cmd = { "G" },
  keys = {
    { ";g", "<cmd>Git<CR>", desc = "Git diff" },
    { ";U", "<cmd>Git push<CR>", desc = "git push" },
    { ";u", "<cmd>Git pull<CR>", desc = "git pull" },
    { ";m", ":Git merge ", desc = "git pull" },
    { ";m", ":Git merge ", desc = "git pull" },
  },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("rafi_fugitive", {}),
      pattern = "fugitiveblame",
      callback = function()
        vim.schedule(function()
          vim.cmd.normal("A")
        end)
      end,
    })
  end,
}
