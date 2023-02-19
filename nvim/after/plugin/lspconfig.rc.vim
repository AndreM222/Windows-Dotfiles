" LSP Bindings

nnoremap <silent> \f <Cmd>Telescope find_files<CR>
nnoremap <silent> \r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> \h <Cmd>Telescope help_tags<CR>

" NVIM Tree Bndings
nnoremap <silent> \t <Cmd>NvimTreeToggle<CR>

" Markdown Bindings
nnoremap <silent> \m <Cmd>MarkdownPreview<CR>
nnoremap <silent> \n <Cmd>MarkdownPreviewStop<CR>

" etc
nnoremap <silent> <C-s> <Cmd>w<CR>
nnoremap <silent> <C-w> <Cmd>wq<CR>
nnoremap <silent> <A-q> <Cmd>q!<CR>

lua << EOF

local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {}

local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup{
    options = { 
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true 
    },
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
vim.keymap.set('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('x', '<C-A-_>', '<Plug>(comment_toggle_blockwise_visual)')

-- auto_comment
require('Comment').setup()

EOF
