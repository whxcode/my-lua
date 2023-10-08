local M = {
    'pwntester/octo.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    opts = {
    },
    config = function()
        require "octo".setup()
    end
}


return M
