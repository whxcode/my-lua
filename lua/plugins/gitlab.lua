local M = {
	"harrisoncramer/gitlab.nvim",
	lazy=false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
		"sindrets/diffview.nvim",
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
}

return M
