" Telescope Bindings
nnoremap <silent> \f <Cmd>Telescope find_files<CR>
nnoremap <silent> \l <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> <F2> <Cmd>Telescope help_tags<CR>
nnoremap <silent> <F3> <Cmd>Telescope keymaps<CR>
nnoremap <silent> <F4> <Cmd>Telescope notify<CR>

" Minimap
nnoremap <silent> \m <Cmd>ToggleMinimap<CR>

" Preview Bindings
nnoremap <silent> \p <Cmd>MarkdownPreviewToggle<CR>

" Saving Bindings
nnoremap <silent> <C-s> <Cmd>w<CR>
nnoremap <silent> <A-w> <Cmd>wq<CR>
nnoremap <silent> <A-q> <Cmd>q!<CR>

" Moving Selections
nnoremap <S-Up> <Cmd>m-2<CR>
nnoremap <S-Down> <Cmd>m+<CR>
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

vnoremap <S-Left> <gv
vnoremap <S-Right> >gv
nnoremap <S-Left> <
nnoremap <S-Right> >

" Paste
xnoremap p pgvy

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

" Lspsaga Setup
nnoremap <C-Down> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap K <Cmd>Lspsaga hover_doc<CR>
nnoremap gd <Cmd>Lspsaga lsp_finder<CR>
inoremap <C-Up> <Cmd>Lspsaga signature_help<CR>
nnoremap gp <Cmd>Lspsaga peek_definition<CR>nnoremap <gr> <Cmd>Lspsaga rename<CR>
nnoremap gr <Cmd>Lspsaga rename<CR>

" Movement between panes
nmap <silent> <C-h> <Cmd>wincmd h<CR>
nmap <silent> <C-l> <Cmd>wincmd l<CR>
nmap <silent> <C-j>  <Cmd>wincmd j<CR>
nmap <silent> <C-k> <Cmd>wincmd k<CR>

" DAP Bindings
nnoremap <F9> <Cmd>DapContinue<CR>
nnoremap <F10> <Cmd>DapStepOver<CR>
nnoremap <F11> <Cmd>DapStepInto<CR>
nnoremap <F12> <Cmd>DapStepOut<CR>
nnoremap b <Cmd>DapToggleBreakpoint<CR>
nnoremap B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))()<CR>
nnoremap lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap dr <Cmd>lua require'dapui'.toggle()<CR>

" vgit Bindings
nnoremap <C-g> <Cmd>VGit buffer_hunk_preview<CR>
nnoremap <A-g> <Cmd>VGit buffer_blame_preview<CR>
nnoremap <C-A-g> <Cmd>VGit buffer_gutter_blame_preview<CR>
nnoremap <S-g> <Cmd>VGit toggle_diff_preference<CR>

" Color Picker
nnoremap <C-c> <Cmd>PickColor<CR>
inoremap <C-c> <Cmd>PickColorInsert<CR>
