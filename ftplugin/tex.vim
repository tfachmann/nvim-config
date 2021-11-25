!texclear %
map k gk
map j gj
map <leader>vc :VimtexCompile
map <leader>vo :VimtexTocOpen
setlocal spell
setlocal ignorecase

let g:tex_flavor = "latex"
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_complete_recursive_bib = 1
"set foldmethod=manual
"let g:tex_fold_enabled = 1
let g:tex_fold_manual = 1
"Open / Close all Folds: zR / zM

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'

let g:polyglot_disabled = ['latex']
