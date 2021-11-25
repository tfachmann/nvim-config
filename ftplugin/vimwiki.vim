"nunmap <Space>wr
"nunmap <Space>wd
"nunmap <Space>whh
"nunmap <Space>wh
autocmd BufWritePost <buffer> silent Vimwiki2HTML
setlocal spell
setlocal ignorecase
map <buffer> j gj
map <buffer> k gk
nmap <leader>vh <Plug>Vimwiki2HTMLBrowse
