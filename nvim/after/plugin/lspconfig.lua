local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

require('lspconfig.ui.windows').default_options.border = 'single'

-- Setup Lsp protocol
local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
    '󰉿', -- Text
    '', -- Method
    '󰊕', -- Function
    '', -- Constructor
    '󰜢', -- Field
    "", -- Variable
    '', -- Class
    '', -- Interface
    '', -- Module
    '󰜢', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '󰌋', -- Keyword
    '', -- Snippet
    '', -- Color
    '󰈙', -- File
    '󰈇', -- Reference
    '󰉋', -- Folder
    '', -- EnumMember
    '', -- Constant
    '󰙅', -- Struct
    '', -- Event
    '', -- Operator
    '', -- TypeParameter
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
        -- Fix omnisharp tokens
        if client.name == "omnisharp" then
            client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                    tokenModifiers = {
                        "declaration",
                        "definition",
                        "readonly",
                        "static",
                        "deprecated",
                        "abstract",
                        "async",
                        "modification",
                        "documentation",
                        "defaultLibrary",
                        "global"
                    },
                    tokenTypes = {
                        "namespace",
                        "type",
                        "class",
                        "enum",
                        "interface",
                        "struct",
                        "typeParameter",
                        "parameter",
                        "variable",
                        "property",
                        "enumMember",
                        "event",
                        "function",
                        "method",
                        "macro",
                        "keyword",
                        "modifier",
                        "comment",
                        "string",
                        "number",
                        "regexp",
                        "operator",
                        "decorator"
                    }
                },
                range = true
            }
        end
    end

    -- Mappings
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.offsetEncoding = { "utf-16" }

-- TypeScript
nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- Markdown
nvim_lsp.marksman.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- C, C++
nvim_lsp.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- C#
nvim_lsp.omnisharp.setup({
    cmd = { "omnisharp" },
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
