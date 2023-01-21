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

local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {}

local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup{
  
  highlights = {
    separator = {
      fg = '#282A36',
    },
    separator_selected = {
      fg = '#073642',
    }, 
    
  },
}

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

EOF
