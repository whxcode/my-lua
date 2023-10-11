return {
	{
		'sidebar-nvim/sidebar.nvim',
		main = 'sidebar-nvim',
		cmd = { 'SidebarNvimToggle', 'SidebarNvimOpen' },
		keys = {
			{ ';gg',  '<cmd>SidebarNvimToggle<CR>',                       desc = 'SidebarNvimToggle' },

		},
		opts = {
			side = "left",
			initial_width = 50,
			open = true,
			bindings = {
				-- stylua: ignore
				['q'] = function() require('sidebar-nvim').close() end,
				[';g'] = function() require('sidebar-nvim').open() end,
			},
		},
	},
}
