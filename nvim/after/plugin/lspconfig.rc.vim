" LSP Bindings

nnoremap <silent> \f <Cmd>Telescope find_files<CR>
nnoremap <silent> \r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> \h <Cmd>Telescope help_tags<CR>

" NVIM Tree Bndings
nnoremap <silent> \t <Cmd>:NvimTreeToggle<CR>

" Markdown Bindings
nnoremap <silent> \m <Cmd>:MarkdownPreview<CR>
nnoremap <silent> \n <Cmd>:MarkdownPreviewStop<CR>


lua << EOF

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

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}
-- C, C++
nvim_lsp.clangd.setup { on_attach = on_attach }

EOF
