-- Setup for startup
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 10
vim.opt.fillchars = { eob = '-' }

vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.updatetime = 100
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.shell = "pwsh"
vim.opt.clipboard = 'unnamedplus'
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.signcolumn = "yes:1"
vim.opt.breakindent = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.backspace = { 'start','eol','indent' }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.incsearch = true

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"

-- Remove indent line in dashboard
vim.g.indent_blankline_filetype_exclude = {'dashboard'}

-- Visual Multi Cursor Remap And Enable Mouse
vim.g.VM_mouse_mappings = 1
vim.g.VM_leader = { default = 'm', visual = 'm', buffer = 'm' }

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "1"

vim.o.statuscolumn = '%s%=%{v:relnum?v:relnum:v:lnum} %{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " } '
