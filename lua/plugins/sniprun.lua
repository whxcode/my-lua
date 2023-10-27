return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    enabled = true,
  },
  build = function() require("gitlab.server").build(true) end, -- Builds the Go binary
  config = function()
    require("gitlab").setup({
      port = 21036, -- The port of the Go server, which runs in the background
      log_path = vim.fn.stdpath("cache") .. "/gitlab.nvim.log", -- Log path for the Go server
      reviewer = "delta", -- The reviewer type ("delta" or "diffview")
      attachment_dir = nil, -- The local directory for files (see the "summary" section)
      popup = { -- The popup for comment creation, editing, and replying
        exit = "<Esc>",
        perform_action = ";g", -- Once in normal mode, does action (like saving comment or editing description, etc)
        perform_linewise_action = ";i", -- Once in normal mode, does the linewise action (see logs for this job, etc)
      },
      discussion_tree = { -- The discussion tree that holds all comments
        blacklist = {}, -- List of usernames to remove from tree (bots, CI, etc)
        jump_to_file = "o", -- Jump to comment location in file
        jump_to_reviewer = "m", -- Jump to the location in the reviewer window
        edit_comment = "e", -- Edit coment
        delete_comment = "dd", -- Delete comment
        reply = "r", -- Reply to comment
        toggle_node = "t", -- Opens or closes the discussion
        toggle_resolved = "p", -- Toggles the resolved status of the discussion
        position = "left", -- "top", "right", "bottom" or "left"
        size = "20%", -- Size of split
        relative = "editor", -- Position of tree split relative to "editor" or "window"
        resolved = '✓', -- Symbol to show next to resolved discussions
        unresolved = '✖', -- Symbol to show next to unresolved discussions
      },
      review_pane = { -- Specific settings for different reviewers
        delta = {
          added_file = "", -- The symbol to show next to added files
          modified_file = "", -- The symbol to show next to modified files
          removed_file = "", -- The symbol to show next to removed files
        }
      },
      dialogue = { -- The confirmation dialogue for deleting comments
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>", "<Space>" },
      },
      pipeline = {
        created = "",
        pending = "",
        preparing = "",
        scheduled = "",
        running = "ﰌ",
        canceled = "ﰸ",
        skipped = "ﰸ",
        success = "✓",
        failed = "",
      },
    })
  end,
  keys = function()
    local gitlab = require("gitlab")

    return {
      { ",glr",  gitlab.review,             desc = "gitlab.review" },
      { ",gls",  gitlab.summary,            desc = "gitlab.summary" },
      { ",glA",  gitlab.approve,            desc = "gitlab.approve" },
      { ",glR",  gitlab.revoke,             desc = "gitlab.revoke" },
      { ",glc",  gitlab.create_comment,     desc = "gitlab.create_comment" },
      { ",gln",  gitlab.create_note,        desc = "gitlab.create_note" },
      { ",gld",  gitlab.toggle_discussions, desc = "gitlab.toggle_discussions" },
      { ",glaa", gitlab.add_assignee,       desc = "gitlab.add_assignee" },
      { ",glad", gitlab.delete_assignee,    desc = "gitlab.delete_assignee" },
      -- { ",glra", gitlab.add_reviewer,       desc = "gitlab.add_reviewer" },
      -- { ",glrd", gitlab.delete_reviewer,    desc = "gitlab.delete_reviewer" },
      { ",glp",  gitlab.pipeline,           desc = "gitlab.pipeline" },
      { ",glo",  gitlab.open_in_browser,    desc = "gitlab.open_in_browser" },
    }
  end
}
