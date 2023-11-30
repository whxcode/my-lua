return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { ";g", "<cmd>DiffviewOpen<CR>", desc = "Diff View" },
  },
  opts = function()
    local actions = require("diffview.actions")
    vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
      group = vim.api.nvim_create_augroup("rafi_diffview", {}),
      pattern = "diffview:///panels/*",
      callback = function()
        vim.opt_local.winhighlight = "CursorLine:WildMenu"
      end,
    })

    return {
      enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
      file_panel = {
        listing_style = "list", -- One of 'list' or 'tree'
        tree_options = { -- Only applies when listing_style is 'tree'
          flatten_dirs = true, -- Flatten dirs that only contain one single dir
          folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = { -- See ':h diffview-config-win_config'
          position = "top",
          height = 20,
          win_opts = {},
        },
      },

      keymaps = {
        view = {
          { "n", "q", "<cmd>DiffviewClose<CR>" },
          { "n", "<Tab>", actions.select_next_entry },
          { "n", "<S-Tab>", actions.select_prev_entry },
          { "n", "<LocalLeader>a", actions.focus_files },
          { "n", "<LocalLeader>e", actions.toggle_files },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<CR>" },
          { "n", "h", actions.prev_entry },
          { "n", "o", actions.focus_entry },
          { "n", "gf", actions.goto_file },
          { "n", "sg", actions.goto_file_split },
          { "n", "st", actions.goto_file_tab },
          { "n", "<C-r>", actions.refresh_files },
          { "n", ";e", actions.toggle_files },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<CR>" },
          { "n", "o", actions.focus_entry },
          { "n", "O", actions.options },
        },
      },
    }
  end,
}
