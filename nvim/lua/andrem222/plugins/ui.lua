return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { "AndreM222/copilot-lualine" }
    },                                                       -- Status Line
    { 'kyazdani42/nvim-web-devicons' },                      -- Icons
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" }, -- Indent Line
    {
        'rcarriga/nvim-notify',
        opts = {
            timeout = 5000,
        },
    },                          -- Notification
    {
        'Mofiqul/dracula.nvim', -- Theme
        lazy = true,
        priority = 1000,
    },
    {
        'glepnir/dashboard-nvim', -- Menu Screen
    },
    { 'rrethy/vim-illuminate' },  -- Highlight
    {
        "kevinhwang91/nvim-ufo",  -- Aesthetic Folding
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufRead"
    },
    { 'nvim-treesitter/nvim-treesitter' }, -- Highlight Colors
    {
        'NvChad/nvim-colorizer.lua', -- Color Highlight
        config = function()
            require('colorizer').setup({
                user_default_options = { css = true, mode = "virtualtext", virtualtext = "󱓻", }
            })
        end,
    },
    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
    },
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        priority = 1200,
        config = function()
            require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = { guifg = "#ffffff" },
                        InclineNormalNC = { guifg = "#44475A" },
                    },
                },
                window = { margin = { vertical = 0, horizontal = 0 } },
                hide = {
                    cursorline = true,
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if vim.bo[props.buf].modified then
                        filename = "[+] " .. filename
                    end

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    return { { icon, guifg = color }, { " " }, { filename } }
                end,
            })
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim"
        }
    }
}
