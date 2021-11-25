"if exists('+termguicolors')
    if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
        let g:vimIsInTmux = 1
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    else
        let g:vimIsInTmux = 0
        set termguicolors
    endif

" Plugins:
    call plug#begin('~/.local/share/nvim/plugged')
     " Autocomplete:
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-vsnip'
        Plug 'hrsh7th/nvim-cmp'
        "Plug 'aca/completion-tabnine', { 'do': './install.sh' }
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
        Plug 'nvim-lua/lsp-status.nvim'
        Plug 'nvim-lua/lsp_extensions.nvim'
        Plug 'RRethy/vim-illuminate'
        Plug 'folke/trouble.nvim'

     " Syntax And Format:
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate'}
        "Plug 'dense-analysis/ale'
        Plug 'Chiel92/vim-autoformat'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-repeat'
        Plug 'vim-pandoc/vim-rmarkdown'
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax'
        Plug 'honza/vim-snippets'
     " Appearance:
        Plug 'lambdalisue/nerdfont.vim'
        Plug 'hoob3rt/lualine.nvim'
        Plug 'kyazdani42/nvim-web-devicons'
        Plug 'sheerun/vim-polyglot'
        Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
        "Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase'}
        Plug 'norcalli/nvim-colorizer.lua'
        Plug 'sainnhe/edge'
        Plug 'folke/lsp-colors.nvim'
     " Preview And Compiler:
        Plug 'euclio/vim-markdown-composer'
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
        Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
     " Motion:
        "Plug 'easymotion/vim-easymotion'
     " Git:
        Plug 'tpope/vim-fugitive'
        "Plug 'TimUntersberger/neogit'
        Plug 'lewis6991/gitsigns.nvim'
     " Rest:
        Plug 'nvim-lua/plenary.nvim'
        Plug 'jose-elias-alvarez/null-ls.nvim'
        Plug 'lervag/vimtex'
        Plug 'scrooloose/nerdcommenter'
        Plug 'kyazdani42/nvim-tree.lua'
        Plug 'Konfekt/vim-DetectSpellLang'
        Plug 'majutsushi/tagbar'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
        "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        "Plug 'junegunn/fzf.vim'
        "Plug 'SirVer/ultisnips'
        Plug 'qpkorr/vim-bufkill'
        Plug 'mattn/webapi-vim'
        Plug 'lambdalisue/suda.vim'
        Plug 'vimwiki/vimwiki'
        Plug 'skywind3000/asyncrun.vim'
        if g:vimIsInTmux == 1
          Plug 'sainnhe/tmuxline.vim', { 'on': [ 'Tmuxline', 'TmuxlineSnapshot' ] }
        endif
    call plug#end()


" Oceanic:
    let g:oceanic_next_terminal_bold = 1
    let g:oceanic_next_terminal_italic = 1

" Edge:
    let g:edge_style = 'default'
    let g:edge_enable_italic = 1
    let g:edge_disable_italic_comment = 1
    let g:edge_transparent_background = 0
    let g:edge_diagnostic_line_highlight = 0

" Configurations:
    "colorscheme badwolf
    "colorscheme oceanic-transparent
    colorscheme edge
    "colorscheme oceanic_custom
    "colorscheme OceanicNext
    "colorscheme challenger_deep
    "colorscheme falcon
    "colorscheme plastic_custom
    "colorscheme equinusocio_material
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Settings:
    set nu
    "set relativenumber
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set clipboard=unnamed,unnamedplus
    set splitbelow
    set splitright
    set smartcase
    set hidden
    set autoread
    set foldlevelstart=99
    set inccommand=split
    "set completeopt=menuone,noinsert,noselect
    set completeopt=menu,menuone,noselect
    set scrolloff=10
    set nobackup
    set nowritebackup
    set cmdheight=1
    set updatetime=50
    set shortmess+=c
    set signcolumn=yes
    set conceallevel=1
    set modeline
    set cursorline
    set undofile
    set thesaurus+=~/.config/nvim/thesaurus/en.txt
    set showtabline=2

" Variables:
    let mapleader = "\<Space>"
    let g:maplocalleader = ","

" Mappings:
    map gm :call cursor(0, virtcol('$')/2)<CR>
    map <C-W>" :split<CR> :terminal<CR> A
    map <C-W>% :vsplit<CR> :terminal<CR> A
    map <C-W>c :e<CR> :terminal<CR> A
    map <C-B> <C-^>
    "map <C-D> :bp <BAR> bd #<CR>
    map <silent><C-D> :BD<CR>
    map <C-E> :enew<CR>
    map <silent><C-N> :bn<CR>
    map <silent><C-P> :bp<CR>
    nmap <C-H> :vertical resize -2<CR>
    nmap <C-L> :vertical resize +2<CR>
    nmap <C-J> :resize -2<CR>
    nmap <C-K> :resize +2<CR>
    map <F9> :ToggleSpell<CR>
    nmap <leader>w :w!<cr>
    nmap <leader>q :q<cr>
    nnoremap <leader>s :nohlsearch<CR>
    nmap <leader>r :source ~/.config/nvim/init.vim<CR>
    nmap <leader>% :source %<CR>
    tnoremap <Esc> <C-\><C-n>
    "inoremap {<CR> {<CR>}<Esc>O
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Commands:
    command! I3config :e ~/.config/i3/config
    command! Vimrc :e ~/.config/nvim/init.vim
    command! Bashrc :e ~/.bashrc

" Macros:
    let @l="ggO[\<ESC>j%a,\<ESC>Gi]\<ESC>"

"{{{tmuxline.vim
    if g:vimIsInTmux == 1
      let g:tmuxline_preset = {
            \'a'    : '#S',
            \'b'    : '%R',
            \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
            \'win'  : [ '#I', '#W' ],
            \'cwin' : [ '#I', '#W', '#F' ],
            \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
            \'y'    : [ '%a' ],
            \'z'    : '#H #{prefix_highlight}'
            \}
      let g:tmuxline_separators = {
            \ 'left' : "\ue0bc",
            \ 'left_alt': "\ue0bd",
            \ 'right' : "\ue0ba",
            \ 'right_alt' : "\ue0bd",
            \ 'space' : ' '}
    endif
"}}}

" Autoformat:
	noremap <F3> :Autoformat<CR>

" Fugitive:
    map <leader>gd :Gdiff<CR>
    map <leader>gs :Git<CR>

" FZF:
	"let $FZF_DEFAULT_COMMAND = 'find . -path ./cache  -prune -o -print'
    "nmap <leader>ff :Files ~/<CR>
    "nmap <leader>fz :Files<CR>
    "nmap <leader>fg :GFiles<CR>
    "nmap <leader>fr :Rg<CR>
    "nmap <leader>fb :Buffers<CR>
    "nmap <leader>fh :History<CR>
    "nmap <leader>fc :History:<CR>
    "nmap <leader>fm :Maps<CR>
    nnoremap <leader>fz <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fv <cmd>lua require('tscope').search_vim_cfg()<cr>

" Rust Vim:
    func! ToggleSpell()
        if &spell == 0
            set spellfile="$HOME/.config/nvim/spell/custom-de.utf-8.add"
            setlocal spell spelllang=custom-de
        else
            set nospell
        endif
    endfu
    com! ToggleSpell call ToggleSpell()

    let g:detectspelllang_langs = {
      \ 'aspell'   : [ 'en_US', 'de_DE' ],
      \ }
    let g:detectspelllang_program = 'aspell'

" UltiSnip:
    "let g:UltiSnipsExpandTrigger = "<C-L>"
    "let g:UltiSnipsJumpForwardTrigger = "<C-L>"
    "let g:UltiSnipsJumpBackwardTrigger = "<s-C-L>"
    "let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips', "UltiSnips"]
    "let g:UltiSnipsSnippetsDir = "$HOME/.config/nvim/ultisnips"

" Vsnip:
    imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    imap <expr> <C-L>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-L>'
    smap <expr> <C-L>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-L>'
    imap <expr> <C-H> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-H>'
    smap <expr> <C-H> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-H>'

" Gui:
    set guifont=Inconsolata:h15
    func! GUI()
        GuiTabline 0
        GuiPopupmenu 0
    endfu
    com! GUI call GUI()

" Suda:
    let g:suda_smart_edit = 1

" IndentLine:
    " let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
    let g:indent_blankline_char_list = ['¦']
    let g:indent_blankline_space_char = '.'
    let g:indent_blankline_use_treesitter = v:true

" Hexokinase:
    let g:Hexokinase_highlighters = ['sign_column']

" VimWiki:
    let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                         \ 'syntax': 'markdown', 
                         \ 'ext': '.wiki',
                         \ 'path_html': '~/Documents/vimwiki/site_html/',
                         \ 'template_path': '~/Documents/vimwiki/templates/',
                         \ 'template_default': 'assets',
                         \ 'template_ext': '.tpl',
                         \ 'custom_wiki2html': 'vimwiki-markdown-rs',
                         \ 'html_filename_parameterization': 1,
                         \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp'}
                         \ }]
    let g:vimwiki_hl_headers = 1
    let g:vimwiki_map_prefix = '<Leader>v'

    nmap <leader>vi <Plug>VimwikiDiaryIndex
    nmap <leader>vs <Plug>VimwikiUISelect
    nmap <leader>vw <Plug>VimwikiIndex
    nmap <leader>vt <Plug>VimwikiTable

" Tagbar:
    nmap <leader>a :TagbarToggle<CR>

" Easy Motion:
    "" <Leader>f{char} to move to {char}
    "map  <Leader>s <Plug>(easymotion-bd-f)
    "nmap <Leader>s <Plug>(easymotion-overwin-f)
    "" s{char}{char} to move to {char}{char}
    "nmap s <Plug>(easymotion-overwin-f2)
    "" Move to line
    "map <Leader>l <Plug>(easymotion-bd-jk)
    "nmap <Leader>l <Plug>(easymotion-overwin-line)
    "" Move to word
    ""map  <Leader>w <Plug>(easymotion-bd-w)
    ""nmap <Leader>w <Plug>(easymotion-overwin-w)

" Nvim LSP:
    lua require("completion")
    lua require("lsp")
    lua require("treesitter")

    let g:diagnostic_insert_delay = 1
    let g:diagnostic_show_sign = 1
    let g:diagnostic_enable_virtual_text = 1

    "autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
    "\ lua require'lsp_extensions'.inlay_hints{ prefix = '', aligned = false, highlight = "Comment", enabled = {"ChainingHint"} }
    "\ lua require'lsp_extensions'.inlay_hints{ prefix = '', aligned = false, highlight = "Comment", enabled = {"ChainingHint", "TypeHint", "ParameterHint" } }
    autocmd InsertLeave,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint"} }

    "autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

"Lua Functions:
    lua require("statusline")
    lua require("nvimtree")
    lua require("git")
    lua require("colors")
    lua require("tscope")

