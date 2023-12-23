local status, dap = pcall(require,"dap")
if (not status) then return end
local status2, dapui = pcall(require,"dapui")
if (not status2) then return end
local status3, daptext = pcall(require,"nvim-dap-virtual-text")
if (not status3) then return end

dapui.setup()
daptext.setup({})

vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapUIStop'})
vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DapUIConditionOutline'})
vim.fn.sign_define('DapLogPoint', {text='', texthl='DapUILogOutline'})
vim.fn.sign_define('DapStopped', {text='', texthl='DapUIThread'})
vim.fn.sign_define('DapBreakpointRejected', {text='󰜺', texthl='DapUIStop'})

dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.open()
end
