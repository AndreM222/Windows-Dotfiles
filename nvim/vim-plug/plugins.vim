call plug#begin('$HOME\AppData\Local\nvim\autoload\plugged')

" Decorations
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rcarriga/nvim-notify'

" Tools
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'gorbit99/codewindow.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tanvirtin/vgit.nvim'

" Mason
Plug 'williamboman/mason.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Color Editing
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ziontee113/color-picker.nvim'

"Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Debbuger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

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
Plug 'L3MON4D3/LuaSnip'

" Folding
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'

call plug#end()
