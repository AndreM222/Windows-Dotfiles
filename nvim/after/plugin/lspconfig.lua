local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Setup Lsp protocol
local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    'ﰠ', -- Field
    "", -- Variable
    '', -- Class
    '', -- Interface
    '', -- Module
    'ﰠ', -- Property
    '塞', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    'פּ', -- Struct
    '', -- Event
    '', -- Operator
    '', -- TypeParameter
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = {"utf-16",}

-- TypeScript
nvim_lsp.tsserver.setup({ capabilities = capabilities})
-- C, C++
nvim_lsp.clangd.setup({
    capabilities = capabilities,
    settings = { Lua = {
        hint = { enable = true }
    } }
})

-- Lua
nvim_lsp.lua_ls.setup({
    capabilities = capabilities,
    settings = { Lua = {
        diagnostics = { globals = { 'vim' } },
        hint = { enable = true }
    } }
})

-- LaTeX
nvim_lsp.texlab.setup({ capabilities = capabilities })

-- html
nvim_lsp.html.setup({ capabilities = capabilities })

-- Python
nvim_lsp.pyright.setup({ capabilities = capabilities })

-- vim
nvim_lsp.vimls.setup({ capabilities = capabilities })

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Setup diagnostic symbol
vim.diagnostic.config({
    virtual_text = { prefix = '♦' },
    update_in_insert = true,
    float = { source = "always" }
})
