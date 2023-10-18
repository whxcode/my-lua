return {
	"aaronhallaert/advanced-git-search.nvim",
	config = function()
		-- optional: setup telescope before loading the extension
		require("telescope").setup {
			-- move this to the place where you call the telescope setup function
			extensions = {
				advanced_git_search = {
					-- fugitive or diffview
					diff_plugin = "diffview",
					show_builtin_git_pickers = false,
					entry_default_author_or_date = "author", -- one of "author" or "date"

					telescope_theme = {
						-- e.g. realistic example
						show_custom_functions = {
							layout_config = { width = 0.4, height = 0.4 },
						},

					}
				}
			}
		}

		require("telescope").load_extension("advanced_git_search")
	end,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
	},
}
