if not _G.plugin_loaded("vimwiki") then
    do return end
end

local g = vim.g
local map = vim.keymap

g.vimwiki_list = { { path = '~/Documents/vimwiki/',
    syntax = 'markdown',
    ext = '.wiki',
    path_html = '~/Documents/vimwiki/site_html/',
    template_path = '~/Documents/vimwiki/templates/',
    template_default = 'assets',
    template_ext = '.tpl',
    custom_wiki2html = 'vimwiki-markdown-rs',
    html_filename_parameterization = 1,
    nested_syntaxes = { python = 'python', ['c++'] = 'cpp' } } }
g.vimwiki_hl_headers = 1
g.vimwiki_map_prefix = "<Leader>v"

map.set('n', '<leader>vi', '<Plug>VimwikiDiaryIndex')
map.set('n', '<leader>vs', '<Plug>VimwikiUISelect')
map.set('n', '<leader>vw', '<Plug>VimwikiIndex')
map.set('n', '<leader>vt', '<Plug>VimwikiTable')
map.set('n', '<leader>vh', '<Plug>Vimwiki2HTMLBrowse')
vim.cmd [[autocmd BufWritePost *.wiki silent Vimwiki2HTML]]
