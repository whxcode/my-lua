local M = {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',       -- OPTIONAL: for git status
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
    config = function ()
        vim.g.barbar_auto_setup = false -- disable auto-setup

        require'barbar'.setup {

        }

        local map = vim.api.nvim_set_keymap 
        local opts = { noremap = true, silent = true, desc = 'toggle buffers' }

        map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
        map('n', ';bc', '<Cmd>BufferClose<CR>', opts)
        map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)



    end
}


return M
