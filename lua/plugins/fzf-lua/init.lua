local M = {
  "ibhagwan/fzf-lua",
  dev = require("utils").is_dev("fzf-lua")
}

function M.init()
  require("plugins.fzf-lua.mappings")
end

function M.config()
  require("plugins.fzf-lua.cmds")
  require("plugins.fzf-lua.setup").setup()

  -- register fzf-lua as vim.ui.select interface
  require("fzf-lua").register_ui_select(function(_, items)
    return { winopts = { height = 0.95, width = 0.95, row = 0.4 } }
  end)
end

return M
