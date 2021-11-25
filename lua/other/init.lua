--require'nvim-web-devicons'.setup {
    --default = true;
--}

local api = vim.api

local M = {}

function M.makeScratch()
    local linenr = api.nvim_win_get_cursor(0)[1]
    local curline = api.nvim_buf_get_lines(0, linenr - 1, linenr, false)[1]
    print(string.format("%s", curline))
    --api.nvim_buf_set_lines(0, linenr - 1, linenr, false, "BLA")
    api.nvim_buf_set_lines(0, 0, 0, false, "BLA")
end

return M
