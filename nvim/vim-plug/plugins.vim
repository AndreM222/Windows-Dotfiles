call plug#begin('$HOME\AppData\Local\nvim\autoload\plugged')

" Decorations
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'dracula/vim', { 'as': 'dracula' }

" Tools
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'lukas-reineke/indent-blankline.nvim'

" AutoCompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*', 'do': 'make install_jsregexp'}

call plug#end()
