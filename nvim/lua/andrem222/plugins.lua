local status, packer = pcall(require, 'packer')
if (not status) then
    print("Packer Is Not Installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Decorations
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'rcarriga/nvim-notify'
    use 'Mofiqul/dracula.nvim'
    use 'rrethy/vim-illuminate'
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
    }

    -- Tools
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'akinsho/nvim-bufferline.lua'
    use 'mg979/vim-visual-multi'
    use 'ThePrimeagen/harpoon'
    use 'lervag/vimtex'

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'tanvirtin/vgit.nvim'

    -- Mason
    use 'williamboman/mason.nvim'
    use 'jay-babu/mason-null-ls.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jay-babu/mason-nvim-dap.nvim'

    -- Color Editing
    use({ 'rrethy/vim-hexokinase', run = "make hexokinase" })
    use 'ziontee113/color-picker.nvim'

    -- Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Debbuger
    use 'mfussenegger/nvim-dap'
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
    use { 'theHamsta/nvim-dap-virtual-text', requires = { 'mfussenegger/nvim-dap' } }

    -- Autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'numToStr/Comment.nvim'
    use 'kylechui/nvim-surround'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'L3MON4D3/LuaSnip'

    -- Folding
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
end)
