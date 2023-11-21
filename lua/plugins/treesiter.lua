return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    { "v", desc = "Increment selection", mode = "x" },
    { "V", desc = "Shrink selection", mode = "x" },
  },
  opts = function(_, opts)
    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = false,
        node_incremental = "v",
        scope_incremental = false,
        node_decremental = "V",
      },
    }

    vim.list_extend(opts.ensure_installed, {
      "glimmer",
    })
  end,
}
