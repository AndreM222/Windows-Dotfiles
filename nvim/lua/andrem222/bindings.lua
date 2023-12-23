local keymap = vim.keymap

-- Telescope Bindings
keymap.set('n', '\\t', '<Cmd>BrowseFiles<CR>', {silent = true}, { desc = "Browse Files" })
keymap.set('n', '\\r', '<Cmd>ResumeSearch<CR>', {silent = true}, { desc = "Resume Search" })
keymap.set('n', '\\f', '<Cmd>FileParse<CR>', {silent = true}, { desc = "File Parse" })
keymap.set('n', '\\l', '<cmd>Telescope live_grep<cr>', {silent = true}, { desc = "Live Grep" })
keymap.set('n', '\\w', '<Cmd>Telescope diagnostics<CR>', {silent = true}, { desc = "Show Diagnostics" })
keymap.set('n', '\\\\', '<Cmd>Telescope buffers<CR>', {silent = true}, { desc = "Show Buffers" })
keymap.set('n', '<F3>', '<Cmd>Telescope help_tags<CR>', {silent = true}, { desc = "Show Help Tags" })
keymap.set('n', '<F4>', '<Cmd>Telescope keymaps<CR>', {silent = true}, { desc = "Show Keymaps" })
keymap.set('n', '<F5>', '<Cmd>Telescope notify<CR>', {silent = true}, { desc = "Show Notifications" })

-- Installations
keymap.set('n', '<S-Home>', '<Cmd>Mason<CR>', {silent = true}, { desc = "Open Mason" })
keymap.set('n', '<Home>', '<Cmd>Lazy<CR>', {silent = true}, { desc = "Open Lazy" })

-- Status
keymap.set('n', '<F6>', '<Cmd>LspInfo<CR>', {silent = true}, { desc = "LSP Info" })
keymap.set('n', '<F7>', '<Cmd>NullLsInfo<CR>', {silent = true}, { desc = "NullLS Info" })

-- Saving Bindings
keymap.set({ 'n', 'v' }, '<C-s>', '<Esc><Cmd>w<CR>', {silent = true}, { desc = "Save" })
keymap.set({ 'n', 'v' }, '<C-A-s>', '<Esc><Cmd>wa<CR>', {silent = true}, { desc = "Save All" })
keymap.set({ 'i','n', 'v' }, '<A-w>', '<Esc><Cmd>wqa<CR>', { desc = "Save All and Quit" })
keymap.set({ 'i','n', 'v' }, '<A-q>', '<Esc><Cmd>q!<CR>', { desc = "Quit" })
keymap.set({ 'i','n', 'v' }, '<C-A-q>', '<Esc><Cmd>qa!<CR>', { desc = "Quit All" })

keymap.set('i', '<C-s>', '<Esc><Cmd>wa<CR>==gi', {silent = true}, { desc = "Save all" })
keymap.set('i', '<C-A-s>', '<Esc><Cmd>w<CR>==gi', {silent = true}, { desc = "Save" })

-- Moving Selections
keymap.set('n', '<A-Down>', ':m .+1<CR>==', {silent = true}, { desc = "Move Selection Down" })
keymap.set('n', '<A-Up>', ':m .-2<CR>==', {silent = true}, { desc = "Move Selection Up" })
keymap.set('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', {silent = true}, { desc = "Move Selection Down" })
keymap.set('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', {silent = true}, { desc = "Move Selection Up" })
keymap.set('v', '<A-Down>', [[:m '>+1<CR>gv=gv]], {silent = true}, { desc = "Move Selection Down" })
keymap.set('v', '<A-Up>', [[:m '<-2<CR>gv=gv]], {silent = true}, { desc = "Move Selection Up" })

keymap.set('v', '<A-Left>', '<gv', { desc = "Move Selection Left" })
keymap.set('v', '<A-Right>', '>gv', { desc = "Move Selection Right" })
keymap.set('i', '<A-Left>', '<Esc><<i', { desc = "Move Selection Left" })
keymap.set('i', '<A-Right>', '<Esc>>>i', { desc = "Move Selection Right" })
keymap.set('n', '<A-Left>', '<<', { desc = "Move Selection Left" })
keymap.set('n', '<A-Right>', '>>', { desc = "Move Selection Right" })

-- Bufferline Bindings
keymap.set('n', '<S-q>', '<Cmd>bdelete<CR>', { desc = "Close Buffer" })
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR> {}', { desc = "Next Buffer" })
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR> {}', { desc = "Previous Buffer" })

-- Comment Binding  
keymap.set('i', '<C-_>', '<ESC><Plug>(comment_toggle_linewise_current)==gi', { desc = "Toggle Comment" })
keymap.set('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)', { desc = "Toggle Comment" })
keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)', { desc = "Toggle Comment" })
keymap.set('x', '<C-A-_>', '<Plug>(comment_toggle_blockwise_visual)', { desc = "Toggle Comment" })

-- Format Bindings
keymap.set({ 'v', 'n', 'i' }, '<S-A-f>', '<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>', { desc = "Format"})

-- Lspsaga Setup
keymap.set('n', 'f', '<Cmd>Lspsaga hover_doc<CR>', { desc = "Show Hover" })
keymap.set('n', 'F', '<Cmd>Lspsaga peek_definition<CR>', { desc = "Peek Definition" })
keymap.set('n', '<C-f>', '<Cmd>Lspsaga goto_definition<CR>', { desc = "Go to Definition" })
keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', { desc = "Find References and Implementations" })
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', { desc = "Rename" })
keymap.set('n', 'gp', '<Cmd>Lspsaga code_action<CR>', { desc = "Code Action" })
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { desc = "Jump to Next Diagnostic" })
keymap.set('n', '<C-S-j>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = "Jump to Previous Diagnostic" })
keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', { desc = "Show Line Diagnostics" })

-- Movement between panes
keymap.set('n', '<C-A-Left>', '<Cmd>wincmd h<CR>', { desc = "Move Pane Left" })
keymap.set('n', '<C-A-Right>', '<Cmd>wincmd l<CR>', { desc = "Move Pane Right" })
keymap.set('n', '<C-A-Down>', '<Cmd>wincmd j<CR>', { desc = "Move Pane Down" })
keymap.set('n', '<C-A-Up>', '<Cmd>wincmd k<CR>', { desc = "Move Pane Up" })

-- Resize panes
keymap.set('n', '<C-A-j>', '<Cmd>vertical resize -4<CR>', { desc = "Resize Pane Left" })
keymap.set('n', '<C-A-l>', '<Cmd>vertical resize +6<CR>', { desc = "Resize Pane Right" })
keymap.set('n', '<C-A-k>', '<Cmd>res +6<CR>', { desc = "Resize Pane Up" })
keymap.set('n', '<C-A-i>', '<Cmd>res -4<CR>', { desc = "Resize Pane Down" })

-- DAP Bindings
keymap.set('n', '<F10>', '<Cmd>DapContinue<CR>', { desc = "Debug Continue" })
keymap.set('n', '<F11>', '<Cmd>DapStepOver<CR>', { desc = "Debug Step Over" })
keymap.set('n', '<F12>', '<Cmd>DapStepInto<CR>', { desc = "Debug Step Into" })
keymap.set('n', '<F13>', '<Cmd>DapStepOut<CR>', { desc = "Debug Step Out" })
keymap.set('n', 'b', '<Cmd>DapToggleBreakpoint<CR>', { desc = "Toggle Breakpoint" })
keymap.set('n', 'B', [[<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))()<CR>]], { desc = "Toggle Conditional Breakpoint" })
keymap.set('n', 'lp', [[<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], { desc = "Toggle Log Point Breakpoint" })
keymap.set('n', 'dr', [[<Cmd>lua require'dapui'.toggle()<CR>]], { desc = "Toggle Debug UI" })

-- Git Bindings
keymap.set('n', '\\g', '<Cmd>DiffviewToggle<CR>', { desc = "Toggle Git Diff View" })

-- Copy Paste Bindings
keymap.set('n', 'y', '"+')
keymap.set('v', 'y', '"+y')

-- Folds
keymap.set('n', '=', '<Cmd>foldopen<CR>', { desc = "Open Fold" })
keymap.set('n', '-', '<Cmd>foldclose<CR>', { desc = "Close Fold" })
keymap.set('n', '+', '<Cmd>OpenAllFolds<CR>', { desc = "Open All Folds" })
keymap.set('n', '_', '<Cmd>CloseAllFolds<CR>', { desc = "Close All Folds" })

-- Ctrl Movement
keymap.set({ 'n', 'v' }, '<C-Right>', 'E')
keymap.set('i', '<C-Right>', '<C-o>E<Right>')

-- Multi Cursor
keymap.set('i', '<C-Up>', '<Esc><Right><Plug>(VM-Add-Cursor-Up)', { desc = "Add Cursor Up" })
keymap.set('i', '<C-Down>', '<Esc><Right><Plug>(VM-Add-Cursor-Down)', { desc = "Add Cursor Down" })
keymap.set({ "i", "n" }, '<C-p>', '<Esc><Plug>(VM-Add-Cursor-At-Pos)', { desc = "Add Cursor At Position" })

-- Select all
keymap.set({ 'i', 'v', 'n' }, '<C-A-a>', '<Esc> ggVG', { desc = "Select All" })

-- Harpoon
keymap.set('n', '\\bs', '<Cmd>HarpoonMark<CR>', { desc = "Set bookmark" })
keymap.set('n', '\\bl', '<Cmd>Harpoon<CR>', { desc = "Open bookmarks" })

keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
