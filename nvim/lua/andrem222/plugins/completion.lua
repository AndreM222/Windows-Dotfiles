return {
        { 'neovim/nvim-lspconfig' }, -- Setup Completion
        {
            'hrsh7th/nvim-cmp', -- Autocompletion
            dependencies = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-cmdline'
            }
        },
        { 'onsails/lspkind-nvim' }, -- Icons
        { 'L3MON4D3/LuaSnip' }, -- Snip
        { 'windwp/nvim-autopairs' }, -- Autopair
        { 'windwp/nvim-ts-autotag' } -- Autotag
}
