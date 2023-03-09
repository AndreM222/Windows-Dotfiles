source $HOME\AppData\Local\nvim\vim-plug\plugins.vim

set encoding=utf-8
scriptencoding=utf-8
set fileencoding=utf-8

let g:chatgpt_api_key = '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'

" Setup for startup

if exists("&termguicolors") && exists("&winblend")
    syntax enable
    set termguicolors
    set winblend=0
    set wildoptions=pum
    set pumblend=10
    set background=dark
    let g:dracula_colorterm=0
    colorscheme dracula
    hi FloatBorder guibg=NONE
    highlight DiffDelete guibg=NONE ctermbg=NONE guifg=red
    highlight cursorlinenr guibg=NONE guifg=Orange
    set fillchars+=eob:-
end

autocmd FileType vgit setlocal diffopt=vertical

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
set scrolloff=10
set ignorecase
