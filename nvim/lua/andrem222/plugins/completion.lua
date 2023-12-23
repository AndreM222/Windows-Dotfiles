return {
    { 'neovim/nvim-lspconfig' }, -- Setup Completion
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestion = { enabled = true },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        }
    },
    {
        'hrsh7th/nvim-cmp', -- Autocompletion
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            {
                "zbirenbaum/copilot-cmp",
                dependencies = "copilot.lua",
                opts = {},
                config = function(_, opts)
                    local copilot_cmp = require("copilot_cmp")
                    copilot_cmp.setup(opts)
                end,
            },
        }
    },
    { 'onsails/lspkind-nvim' },  -- Icons
    { 'L3MON4D3/LuaSnip' },      -- Snip
    { 'windwp/nvim-autopairs' }, -- Autopair
    { 'windwp/nvim-ts-autotag' } -- Autotag
}
