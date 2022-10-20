local map = vim.keymap

if _G.plugin_loaded("gitsigns.nvim") then
    require("gitsigns").setup()
end

if _G.plugin_loaded("vim-fugitive") then
    map.set('n', '<Leader>gs', ':Git<CR>')
end
