require('telescope').setup{}
require('telescope').load_extension('fzf')

local M = {}
M.search_vim_cfg = function()
    require('telescope.builtin').find_files({
        prompt_title = "Nvim Config",
        cwd = "~/.config/nvim/",
        --results_title = "Config Files Results",
        --path_display = { "shorten" },
        --layout_strategy = "horizontal",
        --layout_config = { preview_width = 0.65, width = 0.75 },
        })
end

return M
