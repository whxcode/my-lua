return {
  "CopilotC-Nvim/CopilotChat.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
    debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
    disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
    language = "Chinese", -- Copilot answer language settings when using default prompts. Default language is English.
    -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
    -- temperature = 0.1,
  },
  build = function()
    vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  end,
  keys = {
    -- Show help actions with telescope
    {
      "<leader>cch",
      function()
        require("CopilotChat.code_actions").show_help_actions()
      end,
      desc = "CopilotChat - Help actions",
    },
    -- Show prompts actions with telescope
    {
      "<leader>ccp",
      function()
        require("CopilotChat.code_actions").show_prompt_actions()
      end,
      desc = "CopilotChat - Help actions",
    },
    {
      "<leader>ccq",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          vim.cmd("CopilotChatBuffer " .. input)
        end
      end,
      desc = "CopilotChat - Quick chat",
    },
    {
      "<leader>ccp",
      ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
      mode = "x",
      desc = "CopilotChat - Prompt actions",
    },
  },
}
