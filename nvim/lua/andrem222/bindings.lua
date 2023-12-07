local keymap = vim.keymap

-- Telescope Bindings
keymap.set('n', '\\t', '<Cmd>BrowseFiles<CR>')
keymap.set('n', '\\r', '<Cmd>ResumeSearch<CR>')
keymap.set('n', '\\f', '<Cmd>FileParse<CR>')
keymap.set('n', '\\l', '<cmd>Telescope live_grep<cr>')
keymap.set('n', '\\w', '<Cmd>Telescope diagnostics<CR>')
keymap.set('n', '\\\\', '<Cmd>Telescope buffers<CR>')
keymap.set('n', '<F3>', '<Cmd>Telescope help_tags<CR>')
keymap.set('n', '<F4>', '<Cmd>Telescope keymap<CR>')
keymap.set('n', '<F5>', '<Cmd>Telescope notify<CR>')

-- Installations
keymap.set('n', '<S-Home>', '<Cmd>Mason<CR>')
keymap.set('n', '<Home>', '<Cmd>Lazy<CR>')

-- Status
keymap.set('n', '<F6>', '<Cmd>LspInfo<CR>')
keymap.set('n', '<F7>', '<Cmd>NullLsInfo<CR>')

-- Saving Bindings
keymap.set('n', '<C-s>', '<Cmd>w<CR>')
keymap.set('n', '<C-A-s>', '<Cmd>wa<CR>')
keymap.set('n', '<A-w>', '<Cmd>wqa<CR>')
keymap.set('n', '<A-q>', '<Cmd>q!<CR>')
keymap.set('n', '<C-A-q>', '<Cmd>qa!<CR>')

keymap.set('i', '<C-s>', '<Esc><Cmd>wa<CR>==gi')
keymap.set('i', '<C-A-s>', '<Esc><Cmd>w<CR>==gi')

-- Moving Selections
keymap.set('n', '<A-Down>', ':m .+1<CR>==')
keymap.set('n', '<A-Up>', ':m .-2<CR>==')
keymap.set('i', '<A-Down>', '<Esc>:m .+1<CR>==gi')
keymap.set('i', '<A-Up>', '<Esc>:m .-2<CR>==gi')
keymap.set('v', '<A-Down>', [[:m '>+1<CR>gv=gv]])
keymap.set('v', '<A-Up>', [[:m '<-2<CR>gv=gv]])

keymap.set('v', '<A-Left>', '<gv')
keymap.set('v', '<A-Right>', '>gv')
keymap.set('i', '<A-Left>', '<Esc><<i')
keymap.set('i', '<A-Right>', '<Esc>>>i')
keymap.set('n', '<A-Left>', '<<')
keymap.set('n', '<A-Right>', '>>')

-- Bufferline Bindings
keymap.set('n', '<S-q>', '<Cmd>bdelete<CR>')
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR> {}')
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR> {}')

-- Comment Binding 
keymap.set('i', '<C-_>', '<ESC><Plug>(comment_toggle_linewise_current)==gi')
keymap.set('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)')
keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')
keymap.set('x', '<C-A-_>', '<Plug>(comment_toggle_blockwise_visual)')

-- Format Bindings
keymap.set('n', '<S-A-f>', '<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>')
keymap.set('v', '<S-A-f>', '<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>')

-- Lspsaga Setup
keymap.set('n', 'f', '<Cmd>Lspsaga hover_doc<CR>')
keymap.set('n', 'F', '<Cmd>Lspsaga peek_definition<CR>')
keymap.set('n', '<C-f>', '<Cmd>Lspsaga goto_definition<CR>')
keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>')
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>')
keymap.set('n', 'gp', '<Cmd>Lspsaga code_action<CR>')
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
keymap.set('n', '<C-S-j>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>')

-- Movement between panes
keymap.set('n', '<A-S-j>', '<Cmd>wincmd h<CR>')
keymap.set('n', '<A-S-l>', '<Cmd>wincmd l<CR>')
keymap.set('n', '<A-S-k>', '<Cmd>wincmd j<CR>')
keymap.set('n', '<A-S-i>', '<Cmd>wincmd k<CR>')

-- Resize panes
keymap.set('n', '<C-A-j>', '<Cmd>vertical resize -4<CR>')
keymap.set('n', '<C-A-l>', '<Cmd>vertical resize +6<CR>')
keymap.set('n', '<C-A-k>', '<Cmd>res +6<CR>')
keymap.set('n', '<C-A-i>', '<Cmd>res -4<CR>')

-- DAP Bindings
keymap.set('n', '<F10>', '<Cmd>DapContinue<CR>')
keymap.set('n', '<F11>', '<Cmd>DapStepOver<CR>')
keymap.set('n', '<F12>', '<Cmd>DapStepInto<CR>')
keymap.set('n', '<F13>', '<Cmd>DapStepOut<CR>')
keymap.set('n', 'b', '<Cmd>DapToggleBreakpoint<CR>')
keymap.set('n', 'B', [[<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))()<CR>]])
keymap.set('n', 'lp', [[<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]])
keymap.set('n', 'dr', [[<Cmd>lua require'dapui'.toggle()<CR>]])

-- Git Bindings
keymap.set('n', '\\g', '<Cmd>DiffviewToggle<CR>')

-- Copy Paste Bindings
keymap.set('n', 'y', '"+')
keymap.set('v', 'y', '"+y')

keymap.set('x', 'p', '"_dP')
keymap.set('v', 'p', '"_dP')

-- Folds
keymap.set('n', '=', '<Cmd>foldopen<CR>')
keymap.set('n', '-', '<Cmd>foldclose<CR>')
keymap.set('n', '+', '<Cmd>OpenAllFolds<CR>')
keymap.set('n', '_', '<Cmd>CloseAllFolds<CR>')

-- Ctrl Movement
keymap.set('n', '<C-Right>', 'E')
keymap.set('i', '<C-Right>', '<C-o>E<Right>')
keymap.set('v', '<C-Right>', 'E')

-- Multi Cursor
keymap.set('i', '<C-Up>', '<Esc><Right><Plug>(VM-Add-Cursor-Up)')
keymap.set('i', '<C-Down>', '<Esc><Right><Plug>(VM-Add-Cursor-Down)')
keymap.set('n', '<C-p>', '<Plug>(VM-Add-Cursor-At-Pos)')
keymap.set('i', '<C-p>', '<Esc><Plug>(VM-Add-Cursor-At-Pos)')

-- Select all
keymap.set('n', '<C-A-a>', 'ggVG')
keymap.set('n', '<C-A-a>', '<Esc> ggVG')
keymap.set('v', '<C-A-a>', '<Esc> ggVG')

-- Harpoon
keymap.set('n', 'K', '<Cmd>HarpoonMark<CR>')
keymap.set('n', '<C-h>', '<Cmd>Harpoon<CR>')
