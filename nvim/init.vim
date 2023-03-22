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
    set background=dark
    let g:dracula_colorterm=0
    colorscheme dracula
    hi FloatBorder guibg=NONE guifg=#44475a
    highlight DiffDelete guibg=NONE guifg=#ff5555
    highlight cursorlinenr guifg=Orange
    set fillchars+=eob:-
    highlight Folded  guibg=NONE
    highlight NormalFloat guifg=NONE
    highlight Telescopeborder guifg=#4e5164
    highlight TelescopeResultsTitle guifg=#50fa7b
    highlight TelescopePromptTitle guifg=#50fa7b
    highlight TelescopePreviewTitle guifg=#50fa7b
    highlight TelescopePromptCounter guifg=#4e5164
    highlight WinSeparator guibg=NONE guifg=#44475a
    highlight DraculaSearch cterm=reverse ctermfg=84 gui=reverse guifg=#585d9a guibg=#cad551
    highlight DraculaOrangeInverse cterm=reverse gui=reverse ctermfg=236 ctermbg=215 guifg=#6272A4 guibg=#d5df7b

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
set foldlevel=99
set foldlevelstart=99
set foldenable
set laststatus=3
set incsearch
