-- ww
-- ww
local M = {
	'rcarriga/nvim-dap-ui',
	dependencies = {
		'mfussenegger/nvim-dap',
	},

	config = function()
		local dapui = require("dapui")
		dapui.setup({})
	end
}

return M
