local config = require("rafi.config")
config.ensure_lazy()

-- Start lazy.nvim plugin manager.
require("lazy").setup(vim.tbl_extend("keep", config.user_lazy_opts(), {
	spec = {
		{ import = "rafi.plugins" },
		{ import = "rafi.plugins.extras.lang.json" },
		{ import = "rafi.plugins.extras.lang.python" },
		{ import = "rafi.plugins.extras.lang.go" },
		{ import = "rafi.plugins.extras.lang.yaml" },
		{ import = "rafi.plugins.extras.lang.cmake" },

		-- This will load a custom user lua/plugins.lua or lua/plugins/*
		config.has_user_plugins() and { import = "plugins" } or nil,
	},
	concurrency = vim.loop.available_parallelism() * 2,
	defaults = { lazy = true, version = false },
	dev = { path = config.path_join(vim.fn.stdpath("config"), "dev") },
	install = { missing = true, colorscheme = {} },
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
	ui = { border = "rounded" },
	diff = { cmd = "terminal_git" },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tutor",
				"matchit",
				"tarPlugin",
				"zipPlugin",
				"matchparen",
				"netrwPlugin",
				"2html_plugin",
				"vimballPlugin",
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


set diffopt=internal,filler,closeoff,vertical

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

-- default config
require("bigfile").setup({
	filesize = 5, -- size of the file in MiB, the plugin round file sizes to the closest MiB
	pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
	features = { -- features to disable
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
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd([[ autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false}) ]])

vim.cmd([[
nmap ;s <plug>(SubversiveSubstituteRange)
xmap ;s <plug>(SubversiveSubstituteRange)
nmap ;ss <plug>(SubversiveSubstituteWordRange)
let g:sublimemonokai_term_italic = 1

nnoremap ;r :%s/\<<C-r><C-w>\>/

function! InsertHeaderGuard()
    " Modify the define name format to your liking
    let def = 'header_' . localtime() . '_' . expand('%:t:r') . '_' . expand('%:e')

    " Append to the buffer
    call append(0, '#ifndef ' . def)
    call append(1, '#define ' . def)
    call append(2, '')
    call append(3, '')
    call append(4, '')
    call append(5, '#endif')

    " Place cursor at line 4 column 1
    call cursor(4, 1)
endfunction

" C++ headers
autocmd BufNewFile *.{hpp,h} call InsertHeaderGuard()



map ;n /\v<<C-r><C-w>><Left>

silent! nmap <unique> [z <Plug>(spelunker-jump-next)
silent! nmap <unique> ]z <Plug>(spelunker-jump-prev)
]])
