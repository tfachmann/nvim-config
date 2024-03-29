if not _G.plugin_loaded("telescope.nvim") then
  do return end
end

local telescope = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

local function buffer_previewer_maker(filepath, bufnr, opts)
  opts = opts or {}
  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

telescope.setup{
  defaults = {

    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-c>"] = function()
          vim.cmd [[stopinsert]]
        end,
      },
    },

    layout_config = {
      horizontal = {
        height_padding = 1,
      },
      vertical = {
        height_padding = 1,
      },
    },

    buffer_previewer_maker = buffer_previewer_maker,

  },

  extensions = {
    frecency = {
      default_workspace = "CWD",
    },
  },

  pickers = {
    buffers = {
      ignore_current_buffer = true,
      -- sort_lastused = true,
      sort_mru = true,
    },
  },
}

if _G.plugin_loaded("telescope-harpoon.nvim") then
  telescope.load_extension("harpoon")
end

local search_vim_cfg = function()
    require('telescope.builtin').find_files({
        prompt_title = "Nvim Config",
        cwd = "~/.config/nvim/",
        --results_title = "Config Files Results",
        --path_display = { "shorten" },
        --layout_strategy = "horizontal",
        --layout_config = { preview_width = 0.65, width = 0.75 },
        })
end

-- mappings

local map = vim.keymap
local b = require("telescope.builtin")
map.set('n', '<leader>fa', b.builtin)
map.set('n', '<leader>fz', b.fd)
map.set('n', '<leader>ff', b.find_files)
map.set('n', '<leader>fg', b.git_files)
map.set('n', '<leader>fb', b.buffers)
map.set('n', '<leader>fr', b.live_grep)
map.set('n', '<leader>fm', b.keymaps)
map.set('n', '<leader>fv', search_vim_cfg)
