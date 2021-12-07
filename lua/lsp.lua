-- Setup null-ls
require("null-ls").config {
  sources = {
    require("null-ls").builtins.code_actions.gitsigns,
  }
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    --completion.on_attach(client, bufnr)

    -- vim-illuminate
    require 'illuminate'.on_attach(client)
    vim.api.nvim_set_keymap("n", "ö", '<cmd>lua require"illuminate".next_reference{wrap={true}}<CR>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "Ö", '<cmd>lua require"illuminate".next_reference{reverse=true,wrap={true}}<CR>', {noremap = true, silent = true})

    -- Keybindings for LSPs
    -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
    vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "ge", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<s-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "gF", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<F-5>", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<F-6>", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "m", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<S-M>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
end

nvim_lsp['null-ls'].setup({
    on_attach = on_attach,
})

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

local sumneko_lib = "/usr/lib/lua-language-server/main.lua"
local sumneko_binary = "/usr/bin/lua-language-server"
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
nvim_lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_lib};
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            }
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.vimls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.html.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.cssls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.texlab.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
-- More language servers here! ...
