source $HOME\AppData\Local\nvim\vim-plug\plugins.vim

lua << END
require('lualine').setup()
require('nvim-tree').setup()
END

" Setup for startup "

colorscheme dracula
set termguicolors
set number
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set cursorlineopt=number

