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
    { 'glepnir/lspsaga.nvim' },        -- Tools
    { 'akinsho/nvim-bufferline.lua' }, -- Buffer Tabs
    { 'ThePrimeagen/harpoon' },        -- Bookmarking
    { 'kylechui/nvim-surround' },      -- Sorround
    { 'nvimtools/none-ls.nvim' },      -- Linter and Formatting
    { 'numToStr/Comment.nvim' },       -- Comment

    -- Mason
    {
        'williamboman/mason.nvim',               -- Installer
        dependencies = {
            'jay-babu/mason-null-ls.nvim',       -- For none-ls
            'williamboman/mason-lspconfig.nvim', -- For completion
            'jay-babu/mason-nvim-dap.nvim'       -- For Debuging
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
    {
        "andymass/vim-matchup", -- Improve Match
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
    {
        "monaqa/dial.nvim", -- Improve Increment and Decrement
        keys = {
            { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
            { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
        },
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"],
                    augend.constant.alias.bool,
                    augend.semver.alias.semver,
                    augend.constant.new({ elements = { "let", "const" } }),
                },
            })
        end,
    }
}
