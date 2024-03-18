return {

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },

      {
        "<leader>fg",
        "<cmd>Telescope git_status<CR>",
        desc = "find git status",
      },

      {
        "<leader>r",
        "<cmd>Telescope live_grep<CR>",
        desc = "serach string",
      },

      {
        "<leader><leader>",
        "<cmd>Telescope find_files<CR>",
        {
          desc = "Find files",
          layout_config = {
            -- height = 1,
            --width = 1
          },
        },
      },

      {
        "<leader>gl",
        "<cmd>Telescope git_commits<CR>",
      },

      {
        "<leader>gsl",
        "<cmd>Telescope git_stash<CR>",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
          width = 0.95,
          height = 0.95,
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        git_commits = {
          mappings = {
            i = {
              ["dd"] = function(prompt_bufnr)
                local action_state = require("telescope.actions.state")
                local actions = require("telescope.actions")

                actions.close(prompt_bufnr)
                local value = action_state.get_selected_entry().value
                local cmd = "DiffviewOpen " .. value .. "^!"
                vim.cmd(cmd)
              end,
              ["yy"] = function(prompt_bufnr)
                local action_state = require("telescope.actions.state")
                local actions = require("telescope.actions")

                actions.close(prompt_bufnr)
                local value = action_state.get_selected_entry().value
                vim.fn.setreg("*", value)
              end,
            },
          },
        },

        git_stash = {
          mappings = {
            i = {
              ["dd"] = function(prompt_bufnr)
                local action_state = require("telescope.actions.state")
                local actions = require("telescope.actions")

                actions.close(prompt_bufnr)
                local value = action_state.get_selected_entry().value
                local cmd = "DiffviewOpen " .. value .. "^!"
                vim.cmd(cmd)
              end,
              ["yy"] = function(prompt_bufnr)
                local action_state = require("telescope.actions.state")
                local actions = require("telescope.actions")

                actions.close(prompt_bufnr)
                local value = action_state.get_selected_entry().value
                vim.fn.setreg("*", value)
              end,
            },
          },
        },
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  {
    "telescope.nvim",
    dependencies = {
      "dawsers/telescope-file-history.nvim",
      config = function()
        -- These are the default values
        require("file_history").setup({
          -- This is the location where it will create your file history repository
          backup_dir = "~/.file-history-git",
          -- command line to execute git
          git_cmd = "git",
        })
        require("telescope").load_extension("file_history")
      end,
    },
  },
}
