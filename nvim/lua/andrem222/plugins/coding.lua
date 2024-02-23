return {
    -- Coding Tools
    {
        'numToStr/Comment.nvim', -- Comment
        lazy = false
    },
    {
        'kylechui/nvim-surround', -- Sorround
        version = "*",            -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        "ThePrimeagen/refactoring.nvim", -- Refactoring
        config = function()
            require("refactoring").setup()
        end,
    },
    {
        "monaqa/dial.nvim", -- Incerement and Decrement Improvement
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
