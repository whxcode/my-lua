local M = {
	'mfussenegger/nvim-dap',
	config = function()
		local dap = require("dap")

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = 'executable',
			command = "~/.local/share/nvim/mason/bin/OpenDebugAD7",
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,

				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
		}
		dap.configurations.c = dap.configurations.cpp

		vim.keymap.set({ "i", "n", "v" }, "<F5>", "<cmd>lua require'dap'.continue()<CR>",
			{ silent = true, noremap = true, buffer = bufnr })
		vim.keymap.set({ "i", "n", "v" }, "<F10>", "<cmd>lua require'dap'.step_over()<CR>",
			{ silent = true, noremap = true, buffer = bufnr })
		vim.keymap.set({ "i", "n", "v" }, "<F11>", "<cmd>lua require'dap'.step_into()<CR>",
			{ silent = true, noremap = true, buffer = bufnr })
		vim.keymap.set({ "i", "n", "v" }, "<F12>", "<cmd>lua require'dap'.step_over()<CR>",
			{ silent = true, noremap = true, buffer = bufnr })
		vim.keymap.set({ "i", "n", "v" }, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
			{ silent = true, noremap = true, buffer = bufnr })
	end
}

return M
