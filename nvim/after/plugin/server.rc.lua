local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "🟢",
            server_pending = "⚡",
            server_uninstalled = "⭕"
        }
    }
})

local protocol = require('vim.lsp.protocol')

----- Servers Setup -----

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}
-- C, C++
nvim_lsp.clangd.setup { on_attach = on_attach }

-- Lua
nvim_lsp.lua_ls.setup { on_attach = on_attach }

-- html
nvim_lsp.html.setup { on_attach = on_attach }

-- Python
nvim_lsp.pyright.setup { on_attach = on_attach }

-- vim
nvim_lsp.vimls.setup { on_attach = on_attach }

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '♦'
  },
  update_in_insert = true,
  float = {
    source = "always",
  },
})
