local map = vim.keymap

if _G.plugin_loaded("nvim-dap") then
    local dap = require("dap")
    map.set('n', '<F5>', dap.toggle_breakpoint)
    map.set('n', '<F7>', dap.step_into)
    map.set('n', '<F8>', dap.step_over)
    map.set('n', '<F9>', dap.continue)
end

if _G.plugin_loaded("nvim-dap-ui") then
    require('dapui').setup()
end

if _G.plugin_loaded("nvim-dap-python") then
    require('dap-python').setup('python')
end

if _G.plugin_loaded("nvim-dap-virtual-text") then
    require("nvim-dap-virtual-text").setup()
end
