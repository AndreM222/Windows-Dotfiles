return {
    { 'nvim-lualine/lualine.nvim' }, -- Status Line
    { 'kyazdani42/nvim-web-devicons' }, -- Icons
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" }, -- Indent Line
    { 'rcarriga/nvim-notify' }, -- Notification
    { 
	    'Mofiqul/dracula.nvim',
	    lazy = true,
	    priority = 1000,
    }, -- Theme
    {
        'glepnir/dashboard-nvim', -- Menu Screen
        requires = { { 'nvim-tree/nvim-web-devicons' } }
    },
    { 'rrethy/vim-illuminate' }, -- Highlight
    {
        "kevinhwang91/nvim-ufo", -- Aesthetic Folding
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufRead"
    },
    { 'nvim-treesitter/nvim-treesitter' }, -- Highlight Colors
    {
        'rrethy/vim-hexokinase', -- Color Preview
        build = "make hexokinase"
    }
}
