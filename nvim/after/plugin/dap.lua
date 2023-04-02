local status, dap = pcall(require,"dap")
if (not status) then return end
local status2, dapui = pcall(require,"dapui")
if (not status2) then return end
local status3, daptext = pcall(require,"nvim-dap-virtual-text")
if (not status3) then return end

dapui.setup()
daptext.setup({})

vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapUIStop'})
vim.fn.sign_define('DapStopped', {text='', texthl='DapUIThread'})


dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
    dapui.close()
end

-- --- Adapters --- --

-- CPP Setup
dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7.cmd",
        options = {
        detached = false
    }
}

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        -- CHANGE THIS to your path!
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd",
        args = {"--port", "${port}"},

        -- On windows you may have to uncomment this:
        detached = false,
    }
}

-- --- configurations --- --

-- CPP Setup
dap.configurations.cpp = {
    {
        name = "DBG Debug",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false
    },
    {
        name = "LLDB Debug",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false
    }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
