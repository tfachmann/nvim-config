map <buffer> j gj
map <buffer> k gk
map <buffer> <F5> :AsyncRun Rscript -e 'require(rmarkdown);<SPACE>render("<C-R>%")'<CR>
autocmd BufWritePost <buffer> AsyncRun -raw Rscript -e 'require(rmarkdown); render("%:p")' > lol
setlocal spell
setlocal ignorecase
