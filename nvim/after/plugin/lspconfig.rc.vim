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
nnoremap <S-Up> <Cmd>m-2<CR>
nnoremap <S-Down> <Cmd>m+<CR>
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" Bufferline
nnoremap <S-q> <Cmd>bdelete<CR>
nnoremap <Tab> <Cmd>BufferLineCycleNext<CR> {}
nnoremap <S-Tab> <Cmd>BufferLineCyclePrev<CR> {}

" Comment
nnoremap <C-_> <Plug>(comment_toggle_linewise_current)
xnoremap <C-_> <Plug>(comment_toggle_linewise_visual)
xnoremap <C-A-_> <Plug>(comment_toggle_blockwise_visual)

" Format
nnoremap <C-f> <Cmd>lua vim.lsp.buf.format{ async = true }<CR>

" Set Color previewer
let g:Hexokinase_highlighters = ['sign_column']

lua << EOF

-- Call gitsigns
local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

-- set gitsigns
gitsigns.setup()

-- Call buffer
local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

-- To bufferline
bufferline.setup({
    options = { 
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true 
    },
    highlights = {
        separator = {fg = '#282A36'},
        separator_selected = {fg = '#073642'} 
    }
})

-- auto_comment
require('Comment').setup()

EOF
