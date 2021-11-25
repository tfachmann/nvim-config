local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require 'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    update_focused_files = {
        enable          = true,
        update_cwd      = true,
    },
    view = {
        mappings = {
            list = {
                ['='] = "edit",
            }
        }
    }

}

vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>NvimTreeFindFile<CR>", {noremap = true, silent = true})
vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_indent_markers = 1
