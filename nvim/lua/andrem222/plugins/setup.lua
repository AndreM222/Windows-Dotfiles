return {
    {
        'neovim/nvim-lspconfig', -- Setup Completion
        config = function()
            local nvim_lsp = require("lspconfig")

            require('lspconfig.ui.windows').default_options.border = 'single'

            -- Setup Lsp protocol
            local protocol = require('vim.lsp.protocol')

            protocol.CompletionItemKind = {
                "", -- Text
                "", -- Method
                "", -- Function
                "", -- Constructor
                "", -- Field
                "", -- Variable
                "", -- Class
                "", -- Interface
                "", -- Module
                "", -- Property
                "", -- Unit
                "", -- Value
                "", -- Enum
                "", -- Keyword
                "", -- Snippet
                "", -- Color
                "", -- File
                "", -- Reference
                "", -- Folder
                "", -- EnumMember
                "", -- Constant
                "", -- Struct
                "", -- Event
                "", -- Operator
                "", -- TypeParameter
            }

            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end

                -- Mappings
                local opts = { noremap = true, silent = true }

                buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            end

            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            capabilities.offsetEncoding = { "utf-16" }

            -- TypeScript
            nvim_lsp.tsserver.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }
            -- C, C++
            nvim_lsp.clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- C#
            nvim_lsp.csharp_ls.setup({
                cmd = { "csharp-ls" },
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- Lua
            nvim_lsp.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                -- Uncomment for editing config files
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
                        workspace = {
                            -- Make the server aware of Neovim runtime files for dev
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false
                        }
                    }
                }
            })

            -- html
            nvim_lsp.html.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- Python
            nvim_lsp.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- vim
            nvim_lsp.vimls.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- CSS
            nvim_lsp.cssls.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            -- TailwindCSS
            nvim_lsp.tailwindcss.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    underline = true,
                    virtual_text = { spacing = 4, prefix = '' },
                    severity_sort = true
                }
            )

            -- Diagnostic symbols in the sign column (gutter)
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Setup diagnostic symbol
            vim.diagnostic.config({
                virtual_text = { prefix = '󰣏' },
                update_in_insert = true,
                float = { source = "always" }
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter', -- Highlight Colors
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "markdown",
                    "markdown_inline",
                    "tsx",
                    "toml",
                    "php",
                    "json",
                    "yaml",
                    "css",
                    "html",
                    "lua",
                    "cpp",
                    "c",
                    "c_sharp",
                    "python",
                    "javascript",
                    "vimdoc"
                },
                highlight = {
                    enable = true,
                    disable = {},
                },
                indent = {
                    enable = true,
                    disable = {},
                },
                autotag = { enable = true }
            })

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
        end
    },
    {
        'williamboman/mason.nvim',               -- Installer
        dependencies = {
            'jay-babu/mason-null-ls.nvim',       -- For none-ls
            'williamboman/mason-lspconfig.nvim', -- For completion
            'jay-babu/mason-nvim-dap.nvim'       -- For Debuging
        },
        config = function()
            -- Setup Mason
            require("mason").setup({
                ui = {
                    border = "single",
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "⭕"
                    }
                }
            })

            -- Setuo Null-ls on mason
            require("mason-null-ls").setup({
                ensure_installed = { "prettierd", "clang-format", "eslint_d" },
                automatic_setup = true
            })

            -- Setup lspconfig on mason
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "html",
                    "lua_ls",
                    "pyright",
                    "tsserver",
                    "vimls",
                    "csharp_ls",
                    "tailwindcss",
                    "cssls"
                },
                automatic_installation = true
            })

            -- Setup dap on mason
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb", "cppdbg" },
                handlers = {}
            })
        end
    },
}
