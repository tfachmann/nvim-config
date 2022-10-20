if not _G.plugin_loaded("rust-tools.nvim") then
    do return end
end

--local codelldb_path = "/lib/codelldb/adapter/codelldb"
--local liblldb_path = "/lib/codelldb/lldb/lib/liblldb.so"

--local opts = {
--dap = {
--adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
--}
--}

require("rust-tools").setup({
    server = {
        on_attach = require("plugins._lspconfig"),
    }
})
