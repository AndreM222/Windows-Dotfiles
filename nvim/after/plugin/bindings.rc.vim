" Telescope Bindings
nnoremap <silent> \t <Cmd>BrowseFiles<CR>
nnoremap <silent> \r <Cmd>ResumeSearch<CR>
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
nnoremap <S-Up> <Cmd>m-3<CR>
nnoremap <S-Down> <Cmd>m+<CR>
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

vnoremap <S-Left> <gv
vnoremap <S-Right> >gv
nnoremap <S-Left> <
nnoremap <S-Right> >

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
nnoremap f <Cmd>Lspsaga hover_doc<CR>
nnoremap gd <Cmd>Lspsaga lsp_finder<CR>
nnoremap gp <Cmd>Lspsaga peek_definition<CR>
nnoremap gr <Cmd>Lspsaga rename<CR>

" Movement between panes
nmap <A-Left> <Cmd>wincmd h<CR>
nmap <A-Right> <Cmd>wincmd l<CR>
nmap <A-Down>  <Cmd>wincmd j<CR>
nmap <A-Up> <Cmd>wincmd k<CR>

" Resize panes
nmap <A-l> <Cmd>vertical resize +5<CR>
nmap <A-h> <Cmd>vertical resize -5<CR>
nmap <A-k>  <Cmd>res +5<CR>
nmap <A-j> <Cmd>res -5<CR>

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

" Copy Paste Bindings
nnoremap <C-A-c> "+
vnoremap <C-A-c> "+y
nnoremap <C-A-v> pgvy
vnoremap <C-A-v> pgvy

" Folds
nnoremap = <Cmd>foldopen<CR>
nnoremap - <Cmd>foldclose<CR>
nnoremap + <Cmd>OpenAllFolds<CR>
nnoremap _ <Cmd>CloseAllFolds<CR>
