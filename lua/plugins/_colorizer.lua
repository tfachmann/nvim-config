if not _G.plugin_loaded("nvim-colorizer.lua") then
  do return end
end

lua require'colorizer'.setup()
