" Telescope Bindings
nnoremap <silent> \t <Cmd>BrowseFiles<CR>
nnoremap <silent> \r <Cmd>ResumeSearch<CR>
nnoremap <silent> \f <Cmd>FileParse<CR>
nnoremap <silent> \l <Cmd>Telescope live_grep<CR>
nnoremap <silent> \w <Cmd>Telescope diagnostics<CR> 
nnoremap <silent> \\\ <Cmd>Telescope buffers<CR>
nnoremap <silent> <F3> <Cmd>Telescope help_tags<CR>
nnoremap <silent> <F4> <Cmd>Telescope keymaps<CR>
nnoremap <silent> <F5> <Cmd>Telescope notify<CR>

" Minimap
nnoremap <silent> \m <Cmd>ToggleMinimap<CR>

" Installations
nnoremap <silent> <Home> <Cmd>Mason<CR>

" Status
nnoremap <silent> <F6> <Cmd>LspInfo<CR>
nnoremap <silent> <F7> <Cmd>NullLsInfo<CR>

" Preview Bindings
nnoremap <silent> \p <Cmd>MarkdownPreviewToggle<CR>

" Saving Bindings
nnoremap <silent> <C-s> <Cmd>w<CR>
nnoremap <silent> <C-A-s> <Cmd>wa<CR>
nnoremap <silent> <A-w> <Cmd>wqa<CR>
nnoremap <silent> <A-q> <Cmd>q!<CR>
nnoremap <silent> <C-A-q> <Cmd>qa!<CR>

inoremap <C-s> <Esc><Cmd>w<CR>==gi
inoremap <C-A-s> <Esc><Cmd>wa<CR>==gi

" Moving Selections
nnoremap <silent> <A-Down> :m .+1<CR>==
nnoremap <silent> <A-Up> :m .-2<CR>==
inoremap <silent> <A-Down> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <A-Up> :m '<-2<CR>gv=gv

vnoremap <A-Left> <gv
vnoremap <A-Right> >gv
inoremap <A-Left> <Esc><<i
inoremap <A-Right> <Esc>>>i
nnoremap <A-Left> <<
nnoremap <A-Right> >>

" Bufferline Bindings
nnoremap <S-q> <Cmd>bdelete<CR>
nnoremap <Tab> <Cmd>BufferLineCycleNext<CR> {}
nnoremap <S-Tab> <Cmd>BufferLineCyclePrev<CR> {}

" Comment Bindings
inoremap <C-_> <ESC><Plug>(comment_toggle_linewise_current)==gi
nnoremap <C-_> <Plug>(comment_toggle_linewise_current)
xnoremap <C-_> <Plug>(comment_toggle_linewise_visual)
xnoremap <C-A-_> <Plug>(comment_toggle_blockwise_visual)

" Format Bindings
nnoremap <S-f> <Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>
vnoremap <S-f> <Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>

" Lspsaga Setup
nnoremap f <Cmd>Lspsaga hover_doc<CR>
nnoremap gd <Cmd>Lspsaga lsp_finder<CR>
nnoremap gr <Cmd>Lspsaga rename<CR>
nnoremap gp <Cmd>Lspsaga code_action<CR>

" Movement between panes
nnoremap <A-S-j> <Cmd>wincmd h<CR>
nnoremap <A-S-l> <Cmd>wincmd l<CR>
nnoremap <A-S-k>  <Cmd>wincmd j<CR>
nnoremap <A-S-i> <Cmd>wincmd k<CR>

" Resize panes
nnoremap <C-A-j> <Cmd>vertical resize -4<CR>
nnoremap <C-A-l> <Cmd>vertical resize +6<CR>
nnoremap <C-A-k>  <Cmd>res +6<CR>
nnoremap <C-A-i> <Cmd>res -4<CR>

" DAP Bindings
nnoremap <F10> <Cmd>DapContinue<CR>
nnoremap <F11> <Cmd>DapStepOver<CR>
nnoremap <F12> <Cmd>DapStepInto<CR>
nnoremap <F13> <Cmd>DapStepOut<CR> 
nnoremap b <Cmd>DapToggleBreakpoint<CR>
nnoremap B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))()<CR>
nnoremap lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap dr <Cmd>lua require'dapui'.toggle()<CR>

" vgit Bindings
nnoremap <C-g> <Cmd>VGit buffer_hunk_preview<CR>
nnoremap \g <Cmd>VGit project_diff_preview<CR>

" Color Picker
nnoremap <C-c> <Cmd>PickColor<CR>
inoremap <C-c> <Cmd>PickColorInsert<CR>

" Copy Paste Bindings
nnoremap <C-A-c> "+
vnoremap <C-A-c> "+y
nnoremap <C-A-v> pgvy
vnoremap <C-A-v> pgvy

nnoremap y "+
vnoremap y "+y
nnoremap p pgvy
vnoremap p pgvy

" Folds
nnoremap = <Cmd>foldopen<CR>
nnoremap - <Cmd>foldclose<CR>
nnoremap + <Cmd>OpenAllFolds<CR>
nnoremap _ <Cmd>CloseAllFolds<CR>

" Ctrl Movement
nnoremap <C-Right> E
inoremap <C-Right> <C-o>E<Right>
vnoremap <C-Right> E

" Multi Cursor
inoremap <C-Up> <Esc><Right><Plug>(VM-Add-Cursor-Up)
inoremap <C-Down> <Esc><Right><Plug>(VM-Add-Cursor-Down)
nnoremap <C-p> <Plug>(VM-Add-Cursor-At-Pos)
inoremap <C-p> <Esc><Plug>(VM-Add-Cursor-At-Pos)

" Select all
nnoremap <C-A-a> ggVG
inoremap <C-A-a> <Esc> ggVG

" Harpoon
nnoremap K <Cmd>HarpoonMark<CR>

nnoremap <C-h> <Cmd>Harpoon<CR>
