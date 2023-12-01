return {
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<Leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Spectre",
    },
    {
      "<Leader>sp",
      function()
        require("spectre").open_file_search()
      end,
      desc = "Spectre Word",
    },
  },
  opts = {
    mapping = {
      ["toggle_gitignore"] = {
        map = "tg",
        cmd = "<cmd>lua require('spectre').change_options('gitignore')<CR>",
        desc = "toggle gitignore",
      },
    },
    find_engine = {
      ["rg"] = {
        cmd = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--ignore",
        },
        options = {
          ["gitignore"] = {
            value = "--no-ignore",
            icon = "[G]",
            desc = "gitignore",
          },
        },
      },
    },
    default = {
      find = {
        cmd = "rg",
        options = { "ignore-case", "hidden", "gitignore" },
      },
    },
  },
}
