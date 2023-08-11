-- Rafael Bodill's Neovim entry-point
-- https://github.com/rafi/vim-config

local config = require('rafi.config')
config.ensure_lazy()


-- Start lazy.nvim plugin manager.
require('lazy').setup(vim.tbl_extend('keep', config.user_lazy_opts(), {
	spec = {
		{ import = 'rafi.plugins' },
		{ import = 'rafi.plugins.extras.lang.json' },
		{ import = 'rafi.plugins.extras.lang.python' },
		{ import = 'rafi.plugins.extras.lang.go' },
		{ import = 'rafi.plugins.extras.lang.yaml' },

		-- This will load a custom user lua/plugins.lua or lua/plugins/*
		config.has_user_plugins() and { import = 'plugins' } or nil,
	},
	concurrency = vim.loop.available_parallelism() * 2,
	defaults = { lazy = true, version = false },
	dev = { path = config.path_join(vim.fn.stdpath('config'), 'dev') },
	install = { missing = true, colorscheme = {} },
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
	ui = { border = 'rounded' },
	diff = { cmd = 'terminal_git' },
	performance = {
		rtp = {
			disabled_plugins = {
				'gzip',
				'tutor',
				'matchit',
				'tarPlugin',
				'zipPlugin',
				'matchparen',
				'netrwPlugin',
				'2html_plugin',
				'vimballPlugin',
			},
		},
	},
}))


vim.cmd ([[
function! Sw() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

vnoremap <silent> <buffer> ,w :call Sw()<CR>


set guicursor=n-v-c:block-Cursor
set guicursor+=i:block-Cursor
set guicursor+=n-v-c:block-Cursor
set guicursor+=i:block-Cursor



let g:enable_spelunker_vim = 1
let g:enable_spelunker_vim = 1
let g:spelunker_check_type = 2

set nospell

]])
-- vim.api.nvim_set_keymap('n', ';;', ':', {  })

config.setup()
-- Enjoy!
--

