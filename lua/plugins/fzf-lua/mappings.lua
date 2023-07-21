local map_fzf = function(mode, key, f, options, buffer)
  local desc = nil
  if type(options) == "table" then
    desc = options.desc
    options.desc = nil
  elseif type(options) == "function" then
    desc = options().desc
  end

  local rhs = function()
    local fzf_lua = require("fzf-lua")
    local custom = require("plugins.fzf-lua.cmds")
    -- use deepcopy so options ref isn't saved in the mapping
    -- as this can create weird issues, for example, `lgrep_curbuf`
    -- saving the filename in between executions
    if custom[f] then
      custom[f](options and vim.deepcopy(options) or {})
    else
      fzf_lua[f](options and vim.deepcopy(options) or {})
    end
  end

  local map_options = {
    silent = true,
    buffer = buffer,
    desc   = desc or string.format("FzfLua %s", f),
  }

  vim.keymap.set(mode, key, rhs, map_options)
end

-- mappings
map_fzf("n", "<F1>", "help_tags", { desc = "help tags" })
map_fzf("n", "<leader>fM", "man_pages", { desc = "man pages" })

map_fzf("n", "<c-P>", "files", { desc = "find files" })
map_fzf("n", "<c-K>", "workdirs", {
  desc = "cwd workdirs",
  winopts = {
    height = 0.40,
    width  = 0.60,
    row    = 0.40,
  }
})

map_fzf("n", "<leader> ", "files", {
  desc = "files",
  winopts = {
    height = 0.95,
    width  = 0.95,
    row    = 0.40,
  }
})

map_fzf("n", "<leader>f", "builtin", { desc = "builtin commands" })
map_fzf("n", "<leader>b", "buffers", { desc = "Fzf buffers" })
map_fzf("n", "<leader>ff", "resume", { desc = "resume" })
map_fzf("n", "<leader>fm", "marks", { desc = "marks" })
map_fzf("n", "<leader>fx", "commands", { desc = "commands" })
map_fzf("n", "<leader>fc", "command_history", { desc = "command history" })
map_fzf("n", "<leader>fh", "search_history", { desc = "search history" })
map_fzf("n", [[<leader>f"]], "registers", { desc = "registers" })
map_fzf("n", "<leader>fk", "keymaps", { desc = "keymaps" })
map_fzf("n", "<leader>m", "spell_suggest", {
  desc = "spell suggestions",
  prompt = "Spell> ",
  winopts = {
    relative = "cursor",
    row      = 1.01,
    col      = 0,
    height   = 0.30,
    width    = 0.30,
  }
})


map_fzf("n", "<leader>f3", "blines", function()
  return {
    desc     = "blines <word>",
    fzf_opts = { ["--query"] = vim.fn.expand("<cword>") }
  }
end)
map_fzf("n", "<leader>fH", "oldfiles", {
  desc = "file history (all)",
  cwd = "~",
  cwd_header = false,
})
map_fzf("n", "<leader>fh", "oldfiles", function()
  return {
    desc = "file history (cwd)",
    cwd = vim.loop.cwd(),
    cwd_header = true,
    cwd_only = true,
  }
end)

map_fzf("n", "<leader>f0", "tmux_buffers", { desc = "tmux paste buffers" })
map_fzf("n", "<leader>fq", "quickfix", { desc = "quickfix list" })
map_fzf("n", "<leader>fQ", "loclist", { desc = "location list" })
map_fzf("n", "<leader>fO", "highlights", { desc = "colorscheme highlights" })
map_fzf("n", "<leader>fo", "colorschemes", {
  desc = "colorschemes",
  winopts = { height = 0.45, width = 0.30 },
})

-- LSP
map_fzf("n", "<leader>ll", "lsp_finder", { desc = "location finder [LSP]" })
map_fzf("n", "<leader>lr", "lsp_references", { desc = "references [LSP]" })
map_fzf("n", "<leader>ld", "lsp_definitions",
  { desc = "definitions [LSP]", jump_to_single_result = false })
map_fzf("n", "<leader>lD", "lsp_declarations", { desc = "declarations [LSP]" })
map_fzf("n", "<leader>ly", "lsp_typedefs", { desc = "type definitions [LSP]" })
map_fzf("n", "<leader>lm", "lsp_implementations", { desc = "implementations [LSP]" })
map_fzf("n", "<leader>ls", "lsp_document_symbols", { desc = "document symbols [LSP]" })
map_fzf("n", "<leader>lS", "lsp_workspace_symbols", { desc = "workspace symbols [LSP]" })
map_fzf("n", "<leader>la", "lsp_code_actions", {
  desc = "code actions [LSP]",
  winopts = {
    relative = "cursor",
    row      = 1.01,
    col      = 0,
    height   = 0.20,
    width    = 0.55,
  }
})
map_fzf("n", "<leader>e", "lsp_document_diagnostics", { desc = "document diagnostics [LSP]" })
map_fzf("n", "<leader>lG", "lsp_workspace_diagnostics", { desc = "workspace diagnostics [LSP]" })

map_fzf("n", "gr", "lsp_references", {
  desc = "document references [LSP]",

  winopts = {
    height = 0.95,
    width  = 0.95,
    row    = 0.40,
  }
})

-- Git
map_fzf("n", "<leader>fg", "git_status", {
  desc = "git status",
  winopts = {
    height = 0.95,
    width  = 0.95,
    row    = 0.40,
  }
})

map_fzf("n", "<leader>fb", "git_branches", { desc = "git branches" })
map_fzf("n", "<leader>gC", "git_commits", { desc = "git commits (project)" })
map_fzf({ "n", "v" }, "<leader>gc", "git_bcommits", { desc = "git commits (buffer)" })
-- Full screen git status
map_fzf("n", "<leader>gS", "git_status_tmuxZ", {
  desc = "git status (fullscreen)",
  winopts = {
    fullscreen = true,
    preview = {
      vertical = "down:70%",
      horizontal = "right:70%",
    }
  }
})


vim.keymap.set("n", "<leader>nh", "<cmd>noh<CR>", {
  desc = "no light",
  silent = true,
})

vim.keymap.set("n", "qq", "<cmd>:q!<CR>", {
  desc = "exit",
  silent = true,
})

vim.keymap.set("n", "<leader>r", "<cmd>lua require('fzf-lua').grep()<CR><CR>", {
  desc = "search content",
  silent = true,

})

vim.keymap.set("n", "<leader>rr", "<cmd>lua require('fzf-lua').grep_cword()<CR><CR>", {
  desc = "search content",
  silent = true,

})
