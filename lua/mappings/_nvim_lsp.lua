local mappings_nvim_lsp = {}

local map = vim.keymap
local lsp = vim.lsp

function mappings_nvim_lsp.load()
  -- Navigation
  map.set('n', "gCi",       lsp.buf.incoming_calls, {silent=true})
  map.set('n', "gCo",       lsp.buf.outgoing_calls, {silent=true})
  map.set('n', "gd",        lsp.buf.definition, {silent=true})
  map.set('n', "gD",        lsp.buf.declaration, {silent=true})
  map.set('n', "gi",        lsp.buf.implementation, {silent=true})
  map.set('n', "gr",        lsp.buf.references, {silent=true})
  map.set('n', "gS",        lsp.buf.document_symbol, {silent=true})
  -- map.set('n', "gt",        lsp.buf.type_definition, {silent=true})
  map.set('n', "gw",        lsp.buf.workspace_symbol, {silent=true})

  -- Documentation
  map.set('i', "<C-k>",     lsp.buf.signature_help)
  map.set('n', "<C-k>",     lsp.buf.signature_help, {silent=true})
  map.set('n', "K",         lsp.buf.hover, {silent=true})

  -- Diagnostics
  map.set('n', "M",        vim.diagnostic.goto_prev, {silent=true})
  map.set('n', "m",        vim.diagnostic.goto_next, {silent=true})
  map.set('n', "<space>z",  vim.diagnostic.setloclist, {silent=true})
  map.set('n', "<space>e",  vim.diagnostic.open_float, {silent=true})

  -- Refactoring
  map.set('n', "<space>a",  lsp.buf.code_action, {buffer=true})
  map.set('n', "ga",        lsp.buf.code_action, {buffer=true})
  map.set('n', "gF", lsp.buf.format, {buffer=true})
  map.set('n', "ge", lsp.buf.rename, {buffer=true})

  -- Workspaces
--map.set('n', "<space>wa", lsp.buf.add_workspace_folder, {buffer=true})
--map.set('n', "<space>wl", function()
--  print(vim.inspect(lsp.buf.list_workspace_folders()))
--end, {buffer=true})
--map.set('n', "<space>wr", lsp.buf.remove_workspace_folder, {buffer=true})
end

return mappings_nvim_lsp
