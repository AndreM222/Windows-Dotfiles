" LSP Bindings

nnoremap <silent> \f <Cmd>Telescope find_files<CR>
nnoremap <silent> \r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> \h <Cmd>Telescope help_tags<CR>

" NVIM Tree Bndings
nnoremap <silent> \t <Cmd>NvimTreeToggle<CR>

" Preview Bindings
nnoremap <silent> \m <Cmd>MarkdownPreview<CR>
nnoremap <silent> \n <Cmd>MarkdownPreviewStop<CR>

" etc Bindings
nnoremap <silent> <C-s> <Cmd>w<CR>
nnoremap <silent> <C-w> <Cmd>wq<CR>
nnoremap <silent> <A-q> <Cmd>q!<CR>
nnoremap <S-Up> <Cmd>m-2<CR>
nnoremap <S-Down> <Cmd>m+<CR>
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Left> <gv
vnoremap <S-Right> >gv

" Bufferline Bindings
nnoremap <S-q> <Cmd>bdelete<CR>
nnoremap <Tab> <Cmd>BufferLineCycleNext<CR> {}
nnoremap <S-Tab> <Cmd>BufferLineCyclePrev<CR> {}

" Comment Bindings
nnoremap <C-_> <Plug>(comment_toggle_linewise_current)
xnoremap <C-_> <Plug>(comment_toggle_linewise_visual)
xnoremap <C-A-_> <Plug>(comment_toggle_blockwise_visual)

" Format Bindings
nnoremap <C-f> <Cmd>lua vim.lsp.buf.format({ filter = function(client) return client.name == "null-ls" end,  bufnr = bufnr, })<CR>
