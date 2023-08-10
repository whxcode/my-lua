-- 自定义函数处理 q 键的行为
local M = {}



function M.handle_q()
    local buf_count = vim.api.nvim_buf_call(vim.api.nvim_get_current_buf(), function()
        return vim.api.nvim_buf_call(vim.api.nvim_get_current_buf(), function()
            return vim.api.nvim_buf_call(vim.api.nvim_get_current_buf(), function()
                return vim.api.nvim_list_bufs()
            end)
        end)
    end)

    if #buf_count > 2 then
        vim.api.nvim_command('bd')
    else
        vim.api.nvim_command('q')
    end
end

return M
