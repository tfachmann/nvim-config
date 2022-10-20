local opt = vim.opt
local g = vim.g
local map = vim.keymap

opt.number = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.clipboard = "unnamed,unnamedplus"
opt.smartcase = true
opt.hidden = false
opt.autoread = true
opt.inccommand = "split"
opt.completeopt = "menuone,noinsert,noselect"
opt.scrolloff = 10
opt.backup = false
opt.writebackup = false
opt.cmdheight = 1
opt.updatetime = 50
opt.shortmess = opt.shortmess + 'A'
opt.signcolumn = "yes"
opt.undofile = true
opt.conceallevel = 1
opt.modeline = true
opt.cursorline = true
opt.showtabline = 2
opt.splitright = true
opt.splitbelow = true

vim.cmd [[
  colorscheme tokyonight
  set mouse=a
]]

g.mapleader = ' '

if _G.plugin_loaded("barbar.nvim") then
    map.set('n', '<c-n>', ':BufferNext<CR>', {silent=true, noremap=true})
    map.set('n', '<c-p>', ':BufferPrevious<CR>', {silent=true, noremap=true})
    map.set('n', '<a-n>', ':BufferMoveNext<CR>', {silent=true, noremap = true})
    map.set('n', '<a-p>', ':BufferMovePrevious<CR>', {silent=true, noremap=true})
    map.set('n', '<c-d>', ':BufferClose<CR>', {silent=true, noremap=true})
else
    map.set('n', '<c-n>', ':bnext<CR>', {silent=true, noremap = true})
    map.set('n', '<c-p>', ':bprevious<CR>', {silent=true, noremap = true})
    map.set('n', '<c-d>', ':bdelete<CR>', {silent=true, noremap = true})
end

map.set('n', '<Leader>w', ':write!<CR>')
map.set('n', '<Leader>q', ':quit<CR>')
