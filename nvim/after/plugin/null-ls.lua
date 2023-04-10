local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
    border = 'single',
    sources = {
        -- Formatting
        null_ls.builtins.formatting.prettier.with({
        extra_args = function(params)
            return params.options
                and params.options.tabSize
                and {
                    "--tab-width",
                    params.options.tabSize,
                    "--trailing-comma none",
                    "--no-semi",
                    "--arrow-parens avoid",
                    "--single-quote"
                }
        end,
    }),
        null_ls.builtins.formatting.clang_format.with({
            extra_args = { "--style=Microsoft" }
        }),
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.latexindent,

        -- Diagnostics
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
    },
})
