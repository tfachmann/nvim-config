if not _G.plugin_loaded("lualine.nvim") then
    do return end
end

local sections = {}
if _G.plugin_loaded("nvim-navic") then
    local navic = require("nvim-navic")
    sections = {
        lualine_c = {
            { navic.get_location, cond = navic.is_available },
        }
    }
end

require("lualine").setup {
    options = {
        --lualine.theme = 'forest_night'
        --theme = 'onedark',
        theme = 'tokyonight',
        icons_enabled = true,
        section_separators = nil,
        component_separators = nil,
        globalstatus = true,
    },
    sections = sections,
}
