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


vim.cmd([[
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

let g:any_jump_list_numbers = 1
]])
-- vim.api.nvim_set_keymap('n', ';;', ':', {  })

config.setup()
-- Enjoy!
--
-- 配置 Neogit 显示行号
require 'neogit'.setup {
	integrations = {
		diffview = true,
	},
	-- 自定义 diff 渲染器
	custom_diff_renderer = { line_numbers = true },
}


-- default config
require("bigfile").setup {
	filesize = 5,     -- size of the file in MiB, the plugin round file sizes to the closest MiB
	pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
	features = {      -- features to disable
		"indent_blankline",
		"illuminate",
		"lsp",
		"treesitter",
		"syntax",
		"matchparen",
		"vimopts",
		"filetype",
		"neo-tree.nvim",
		"LuaSnip",
		"SchemaStore.nvim ",
		"SnippetGenie ",
		"awesome-vim-colorschemes ",
		"ccc.nvim ",
		"cmp-buffer ",
		"cmp-emoji ",
		"cmp-nvim-lsp ",
		"cmp-path ",
		"cmp-tmux ",
		"cmp_luasnip ",
		"diffview.nvim ",
		"dracula.nvim ",
		"guess-indent.nvim ",
		"marks.nvim ",
		"mini.ai ",
		"mini.comment ",
		"mini.trailspace ",
		"neo-hybrid.vim ",
		"neoconf-venom.nvim ",
		"null-ls.nvim ",
		"nvim-autopairs ",
		"nvim-blackline ",
		"nvim-navic ",
		"nvim-notify ",
		"nvim-surround ",
		"nvim-treesitter-endwise ",
		"nvim-ts-autotag ",
		"nvim-ts-context-commentstring ",
		"nvim-web-devicons ",
		"nvim-window-picker ",
		"persisted.nvim ",
		"spelunker.vim ",
		"suda.vim ",
		"theme-loader.nvim ",
		"todo-comments.nvim ",
		"vim-colors-xcode ",
		"vim-illuminate ",
		"vim-matchup ",
		"vim-tmux-navigator ",
		"vim-visual-multi ",
		"which-key.nvim ",
	},
}



local gitlab = require("gitlab")
vim.keymap.set("n", "<leader>glr", gitlab.review)
vim.keymap.set("n", "<leader>gls", gitlab.summary)
vim.keymap.set("n", "<leader>glA", gitlab.approve)
vim.keymap.set("n", "<leader>glR", gitlab.revoke)
vim.keymap.set("n", "<leader>glc", gitlab.create_comment)
vim.keymap.set("n", "<leader>gln", gitlab.create_note)
vim.keymap.set("n", "<leader>gld", gitlab.toggle_discussions)
vim.keymap.set("n", "<leader>glaa", gitlab.add_assignee)
vim.keymap.set("n", "<leader>glad", gitlab.delete_assignee)
vim.keymap.set("n", "<leader>glra", gitlab.add_reviewer)
vim.keymap.set("n", "<leader>glrd", gitlab.delete_reviewer)
vim.keymap.set("n", "<leader>glp", gitlab.pipeline)
vim.keymap.set("n", "<leader>glo", gitlab.open_in_browser)

vim.keymap.set("n", ";s", require('substitute.range').operator, { noremap = true })
vim.keymap.set("x", ";s", require('substitute.range').visual, { noremap = true })
vim.keymap.set("n", ";ss", require('substitute.range').word, { noremap = true })
