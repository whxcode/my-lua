local M = {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    lazy = false,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    config = function()
        require 'barbar'.setup {
            icons = {
                button = '',
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
                    [vim.diagnostic.severity.WARN] = { enabled = true },
                    [vim.diagnostic.severity.INFO] = { enabled = true },
                    [vim.diagnostic.severity.HINT] = { enabled = true },
                },
                filetype = {
                    -- Sets the icon's highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = true,

                    -- Requires `nvim-web-devicons` if `true`
                    enabled = true,
                },

                -- If true, add an additional separator at the end of the buffer list
                separator_at_end = true,

                -- Configure the icons on the bufferline when modified or pinned.
                -- Supports all the base icon options.
                modified = { button = '●' },
                pinned = { button = '', filename = true },

                -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
                preset = 'powerline',

                -- Configure the icons on the bufferline based on the visibility of a buffer.
                -- Supports all the base icon options, plus `modified` and `pinned`.
                alternate = { filetype = { enabled = false } },
                current = { buffer_index = true },
                inactive = { button = '' },
                visible = { modified = { buffer_number = false } },
            },

        }

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true, desc = 'toggle buffers' }

        map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
        map('n', ';x', '<Cmd>BufferClose<CR>', opts)
        map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
        map('n', ';q', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
    end
}


return M
