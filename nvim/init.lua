require('andrem222.plugins')
require('andrem222.theme')

vim.cmd([[

    " Theme Setup
    colorscheme dracula 

    " Remove highlight on movement
    autocmd CursorMoved * set nohlsearch
    nnoremap n n:set hlsearch<cr>

    " Visual Multi Cursor Remap And Enable Mouse
    let g:VM_mouse_mappings = 1
    let g:VM_leader = {'default':'m', 'visual':'m', 'buffer':'m'}
    let g:dracula_<style-name> = 0

]])

-- Setup for startup
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 10
vim.opt.fillchars = { eob = '-' }

vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.o.updatetime = 100
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.clipboard = 'unnamedplus'
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.signcolumn = "yes:1"
vim.opt.breakindent = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.backspace = { 'start','eol','indent' }
vim.opt.path:append {'**'}
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.incsearch = true

vim.g.indent_blankline_filetype_exclude = {'dashboard'}
