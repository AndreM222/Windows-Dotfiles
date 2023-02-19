source $HOME\AppData\Local\nvim\vim-plug\plugins.vim

lua << END
require('lualine').setup()
require("nvim-tree").setup()

END
scriptencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

" Setup for startup "

if exists("&termguicolors") && exists("&winblend")
    syntax enable
    set termguicolors
    set winblend=0
    set wildoptions=pum
    set pumblend=10
    set background=dark
    let g:dracula_colorterm = 0
    colorscheme dracula
end

set number
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set cursorlineopt=number
set clipboard+=unnamedplus
set autoindent
set smarttab
set breakindent
set ai 
set si
set backspace=start,eol,indent
set path:append{'**'}
set wildignore:append{'*/node_modules/*'}
