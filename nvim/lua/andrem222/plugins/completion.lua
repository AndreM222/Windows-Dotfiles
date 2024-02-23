return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestion = { enabled = true },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        }
    },
    {
        'hrsh7th/nvim-cmp', -- Autocompletion
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            {
                "zbirenbaum/copilot-cmp",
                dependencies = "copilot.lua",
                opts = {},
                config = function(_, opts)
                    require("copilot_cmp").setup(opts)
                end,
            },
        },
        config = function()
            local cmp = require("cmp")

            vim.api.nvim_set_hl(0, "cmpnormal", { bg = "#21222c" })

            cmp.setup({
                window = {
                    documentation = {
                        winhighlight = "normal:cmpnormal",
                    }
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<c-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<c->'] = cmp.mapping.scroll_docs(4),
                    ['<c-space>'] = cmp.mapping.complete(),
                    ['<tab>'] = cmp.mapping.confirm({ select = true }),
                    ['<c-e>'] = cmp.mapping.abort(),
                    ['<cr>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'luasnip' },
                    {
                        name = "copilot",
                        group_index = 1,
                        priority = 100
                    }
                }),
                formatting = {
                    fields = { 'kind', 'abbr', 'menu' },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry,
                            vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = (strings[1] or "")
                        kind.menu = "    " .. (strings[2] or "") .. ""
                        kind.ellipsis_char = '...'

                        return kind
                    end,
                }
            })

            -- set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'cmp_git' },
                }, {
                    { name = 'buffer' },
                })
            })

            vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link cmpitemkind cmpitemmenudefault
]]
        end
    },
    {
        'onsails/lspkind-nvim', -- Icons
        config = function()
            require("lspkind").init({
                mode = 'symbol_text',
                preset = 'codicons',
                symbol_map = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                    Copilot = ""
                }
            })
        end
    },
    { 'L3MON4D3/LuaSnip' },      -- Snip
    {
        'windwp/nvim-autopairs', -- Autopairs
        config = function()
            local autopairs = require("nvim-autopairs")

            autopairs.setup()

            local Rule = require('nvim-autopairs.rule')
            local cond = require('nvim-autopairs.conds')

            local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
            autopairs.add_rules {
                Rule(' ', ' ')
                    :with_pair(function(opts)
                        local pair = opts.line:sub(opts.col - 1, opts.col)
                        return vim.tbl_contains({
                            brackets[1][1] .. brackets[1][2],
                            brackets[2][1] .. brackets[2][2],
                            brackets[3][1] .. brackets[3][2]
                        }, pair)
                    end)
                    :with_move(cond.none())
                    :with_cr(cond.none())
                    :with_del(function(opts)
                        local col = vim.api.nvim_win_get_cursor(0)[2]
                        local context = opts.line:sub(col - 1, col + 2)
                        return vim.tbl_contains({
                            brackets[1][1] .. '  ' .. brackets[1][2],
                            brackets[2][1] .. '  ' .. brackets[2][2],
                            brackets[3][1] .. '  ' .. brackets[3][2]
                        }, context)
                    end)
            }
            for _, bracket in pairs(brackets) do
                Rule('', ' ' .. bracket[2])
                    :with_pair(cond.none())
                    :with_move(function(opts) return opts.char == bracket[2] end)
                    :with_cr(cond.none())
                    :with_del(cond.none())
                    :use_key(bracket[2])
            end
        end,

    },
    { 'windwp/nvim-ts-autotag' } -- Autotag
}
