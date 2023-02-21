local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
local status3, nullls = pcall(require, "mason-null-ls")
if (not status3) then return end
local status4, mason = pcall(require, "mason")
if (not status4) then return end

-- Setuo Null-ls on mason
nullls.setup({ automatic_setup = true })

-- Setup Mason
mason.setup()

-- Setup lspconfig on mason
lspconfig.setup({ automatic_installation = true })

-- Setup Lsp protocol
local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    'ﰠ', -- Field
    '', -- Variable
    '', -- Class
    '', -- Interface
    '', -- Module
    'ﰠ', -- Property
    '塞', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    'פּ', -- Struct
    '', -- Event
    '', -- Operator
    '', -- TypeParameter
}

-- TypeScript
nvim_lsp.tsserver.setup({ filetypes = { "typescript", "typescriptreact", "typescript.tsx" } })
-- C, C++
nvim_lsp.clangd.setup({})

-- Lua
nvim_lsp.lua_ls.setup({
    settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
})

-- html
nvim_lsp.html.setup({})

-- Python
nvim_lsp.pyright.setup({})

-- vim
nvim_lsp.vimls.setup({})

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
