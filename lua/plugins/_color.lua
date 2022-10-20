if not _G.plugin_loaded("tokyonight.nvim") then
    do return end
end

require("tokyonight").setup({
    style = "night",
})

