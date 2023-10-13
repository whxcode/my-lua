local M = {
	'Mofiqul/dracula.nvim',
	lazy = false,
	config = function()
		local dracula = require("dracula")
		dracula.setup({
			colors = {
				green = "#FFB86C",
			},
		})
	end
}

return M
