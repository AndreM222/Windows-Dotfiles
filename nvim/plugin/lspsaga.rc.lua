local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup({
    symbol_in_winbar = {
        enable = false,
    },
    ui = {
        border = 'rounded',
        code_action = ""
    },
})
