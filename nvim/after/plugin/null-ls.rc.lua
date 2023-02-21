local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.astyle,
        null_ls.builtins.formatting.autopep8,
    },
})
