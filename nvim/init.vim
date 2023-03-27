source $HOME\AppData\Local\nvim\vim-plug\plugins.vim

set encoding=utf-8
scriptencoding=utf-8
set fileencoding=utf-8

" Setup for startup
if exists("&termguicolors") && exists("&winblend")
    syntax enable
    set termguicolors
    set winblend=0
    set wildoptions=pum
    set pumblend=10
    set fillchars+=eob:-
    let colorscheme_bg = "dark"
    let g:dracula_colorterm=0
    colorscheme dracula
    highlight FloatBorder guibg=NONE guifg=#6272A4
    highlight DiffDelete guibg=NONE guifg=#ff5555
    highlight cursorlinenr guifg=Orange
    highlight Folded  guibg=NONE
    highlight NormalFloat guifg=NONE
    highlight Telescopeborder guifg=#6272A4
    highlight TelescopeResultsTitle guifg=#50fa7b
    highlight TelescopePromptTitle guifg=#50fa7b
    highlight TelescopePreviewTitle guifg=#50fa7b
    highlight TelescopePromptCounter guifg=#4e5164
    highlight WinSeparator guibg=NONE guifg=#6272A4
    highlight DraculaSearch cterm=reverse ctermfg=84 gui=reverse guifg=#585d9a guibg=Orange
    highlight DraculaOrangeInverse cterm=reverse gui=reverse ctermfg=236 ctermbg=215 guifg=#6272A4
    highlight NullLsInfoBorder guifg=#6272A4
    highlight LspInfoBorder guifg=#6272A4
    highlight IndentBlanklineContextChar guifg=#555c84
end

set mouse=a
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
set laststatus=3
set incsearch

" Remove highlight on movement
autocmd CursorMoved * set nohlsearch
nnoremap n n:set hlsearch<cr>
