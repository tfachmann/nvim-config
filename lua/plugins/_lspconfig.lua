-- Excellent example: https://github.com/lukas-reineke/dotfiles/blob/master/vim/lua/lsp/init.lua

if not _G.plugin_loaded("nvim-lspconfig") then
    do return end
end

if _G.plugin_loaded("null-ls.nvim") then
    local sources = {}
    if _G.plugin_loaded("gitsigns.nvim") then
        sources = { require("null-ls").builtins.code_actions.gitsigns }
    end

    require("null-ls").setup({
        sources = sources
    })
end

if _G.plugin_loaded("lsp-format.nvim") then
    require("lsp-format").setup {}
end

if _G.plugin_loaded("lsp-inlayhints.nvim") then
    require("lsp-inlayhints").setup {
        inlay_hints = {
            --highlight = "LspInlayHint",
            highlight = "Comment",
        }
    }
end

local nvim_lsp = require("lspconfig")

local function on_attach(client, bufnr)
    print("LSP started.")

    if _G.plugin_loaded("completion-nvim") then
        -- For completion-nvim:
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "")
        require("completion").on_attach(client)
    else
        -- For built-in LSP omnifunc:
        vim.api.nvim_buf_set_option(bufnr, "completefunc", "v:lua.vim.lsp.omnifunc")
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    end

    if _G.plugin_loaded("nvim-navic") then
        if client.supports_method "textDocument/documentSymbol" and client.name ~= "bashls" then
            require("nvim-navic").attach(client, bufnr)
        end
    end

    if _G.plugin_loaded("lsp-format.nvim") then
        require("lsp-format").on_attach(client)
    end

    if _G.plugin_loaded("lsp-inlayhints.nvim") then
        if client.supports_method "textDocument/inlayHint" then
            print("inlayHints supported!")
            require("lsp-inlayhints").on_attach(client, bufnr)
        end
    end


    require("plugins._lspkind_nvim")
    require("plugins._lsp_signature_nvim")
    require("mappings._nvim_lsp").load()

    -- Hide latest message.
    print(" ")
end

local servers = {
    -- "bashls",
    --"ccls",
    "clangd",
    -- "clojure_lsp",
    "cmake",
    "cssls",
    --"diagnosticls",
    "hls",
    "html",
    -- "jdtls",
    -- "jsonls",
    -- "kotlin_language_server",
    -- "matlab",
    -- "metals",
    -- "py_custom",
    -- "pyright",
    -- "rnix",
    --"rust_analyzer",
    "pyright",
    "sumneko_lua",
    "texlab",
    "tsserver",
    "vimls",
    "yamlls",
    "efm",
}

local efm = require("plugins._efm")
--local isort = require "efm/isort"
--local flake8 = require "efm/flake8"
--local mypy = require "efm/mypy"

efm_languages = {
    python = { efm.black, efm.isort, efm.flake8, efm.mypy },
}

local configs = {
    --diagnosticls = require("plugins._lsp_diagnosticls"),
    sumneko_lua = require("plugins._lsp_sumneko_lua"),
    cssls = {
        cmd = { "vscode-css-languageserver", "--stdio" }
    },
    efm = {
        init_options = { documentFormatting = true },
        filetypes = vim.tbl_keys(efm_languages),
        settings = {
            rootMarkers = { ".git/" },
            lintDebounce = 100,
            languages = efm_languages,
        }
    },
}

local config_defaults = {}
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("plugins._nvim_cmp")

for _, lsp in ipairs(servers) do
    local config = configs[lsp] or {}
    config.on_attach = on_attach
    config.capabilities = capabilities
    config = vim.tbl_extend("keep", config, config_defaults)
    nvim_lsp[lsp].setup(config)
end

return on_attach
