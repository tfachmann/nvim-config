if not _G.plugin_loaded("nvim-cmp") then
  do return end
end

local cmp = require("cmp")
local compare = require('cmp.config.compare')
local lspkind_symbols = require("plugins._lspkind_symbols")
local lspkind = require("lspkind")

cmp.setup {
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  formatting = {
    --format = function(entry, vim_item)
      --local max_len = 20
      --if string.len(vim_item.abbr) > max_len then
        --vim_item.abbr = string.sub(vim_item.abbr, 1, max_len - 2) .. "··"
      --end
      --vim_item.kind = lspkind_symbols.kind_map[vim_item.kind]
      --vim_item.menu = lspkind_symbols.source_map[entry.source.name]
      --return vim_item
    --end,
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    })
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ["<PageUp>"] = function(fallback)
      for i = 1, 8 do
        cmp.mapping.select_prev_item()(nil)
      end
    end,
    ["<PageDown>"] = function(fallback)
      for i = 1, 8 do
        cmp.mapping.select_next_item()(nil)
      end
    end,
    },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      -- require("luasnip").lsp_expand(args.body)
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.scopes,
      compare.locality,
      compare.recently_used,
      compare.score,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  sources = {
    { name = "nvim_lsp", max_item_count = 30 },
    { name = "path" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "vsnip" },
    { name = "latex_symbols" },
    { name = "tmux" },
  },
}
