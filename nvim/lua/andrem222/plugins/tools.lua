return {
        -- Tools
        {
            'nvim-telescope/telescope.nvim', -- File Explorer
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-file-browser.nvim",
                "nvim-telescope/telescope-ui-select.nvim" -- Selection UI
            }
        },
        { 'glepnir/lspsaga.nvim' }, -- Tools
        { 'akinsho/nvim-bufferline.lua' }, -- Buffer Tabs
        { 'mg979/vim-visual-multi' }, -- Multi Cursor
        { 'ThePrimeagen/harpoon' }, -- Bookmarking
        { 'kylechui/nvim-surround' }, -- Sorround
        { 'nvimtools/none-ls.nvim' }, -- Linter and Formatting
        { 'numToStr/Comment.nvim' }, -- Comment

        -- Mason
        {
            'williamboman/mason.nvim', -- Installer
            dependencies = {
                'jay-babu/mason-null-ls.nvim', -- For none-ls
                'williamboman/mason-lspconfig.nvim', -- For completion
                'jay-babu/mason-nvim-dap.nvim' -- For Debuging
            }
        },

        -- Preview
        {
            "iamcco/markdown-preview.nvim", -- Preview Markdown
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            ft = { "markdown" },
            build = function() vim.fn["mkdp#util#install"]() end,
        },
        {
            'mfussenegger/nvim-dap', -- Debbuger
            dependencies = {
                'rcarriga/nvim-dap-ui',
                'theHamsta/nvim-dap-virtual-text'
            }
        },

}
