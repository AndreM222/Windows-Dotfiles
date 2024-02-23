return {
    {
        'nvim-lualine/lualine.nvim', -- Status Line
        dependencies = { "AndreM222/copilot-lualine" },
        config = function()
            local cozynight = require('lualine.themes.palenight')

            cozynight.insert.a.bg = '#f7397c'
            cozynight.insert.b.fg = '#f7397c'
            cozynight.visual.a.bg = '#ffb86c'
            cozynight.visual.b.fg = '#ffb86c'

            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = cozynight,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {},
                    always_divide_middle = true
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff',
                        {
                            'diagnostics',
                            sources = { "nvim_diagnostic" },
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                        }
                    },
                    lualine_c = { 'filename' },
                    lualine_x = {
                        {
                            'copilot',
                            symbols = {
                                status = {
                                    icons = {
                                        enabled = "",
                                        sleep = "",
                                        disabled = "",
                                        warning = "",
                                        unknown = ""
                                    }
                                }
                            }
                        },
                        'encoding',
                        'fileformat',
                        'filetype'
                    },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            })
        end
    },
    { 'kyazdani42/nvim-web-devicons' },                      -- Icons
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" }, -- Indent Line
    {
        'rcarriga/nvim-notify',
        opts = {
            timeout = 5000,
        },
        config = function()
            local notify = require('notify')

            notify.setup({ background_colour = "#000000" })
            vim.notify = notify

            -- Notification Update
            local client_notifs = {}

            local function get_notif_data(client_id, token)
                if not client_notifs[client_id] then client_notifs[client_id] = {} end

                if not client_notifs[client_id][token] then client_notifs[client_id][token] = {} end

                return client_notifs[client_id][token]
            end
        end
    },                          -- Notification
    {
        'Mofiqul/dracula.nvim', -- Theme
        lazy = true,
        priority = 1000,
    },
    {
        'glepnir/dashboard-nvim', -- Menu Screen
        config = function()
            require("dashboard").setup({
                config = {
                    header = {
                        ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
                        ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
                        ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
                        ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
                        ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
                        ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
                        '                                                       ',
                    },
                    shortcut = {
                        {
                            desc = ' Files',
                            group = 'Label',
                            action = 'BrowseFiles',
                            key = 'f',
                        },
                        {
                            desc = ' Keymaps',
                            group = 'DiagnosticHint',
                            action = 'Telescope keymaps',
                            key = 'k',
                        },
                        {
                            desc = ' Dotfiles',
                            group = 'Number',
                            action = 'Telescope file_browser cwd=$HOME/Appdata/local/nvim', -- Change to your dotfiles path
                            key = 'd',
                        },
                        {
                            desc = '󰝒 New File',
                            group = 'DiagnosticWarn',
                            action = 'ene ',
                            key = 'e',
                        }
                    },
                    packages = { enable = false },
                    footer = {
                        "",
                        "NVIM v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                    }
                }
            })
        end
    },
    { 'rrethy/vim-illuminate' }, -- Highlight
    {
        "kevinhwang91/nvim-ufo", -- Aesthetic Folding
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufRead",
        config = function()
            local ibl = require("ibl")

            local ufo = require("ufo")

            ufo.setup()

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }

            local language_servers = require("lspconfig").util.available_servers()
            for _, ls in ipairs(language_servers) do
                require('lspconfig')[ls].setup({
                    capabilities = capabilities
                })
            end

            vim.api.nvim_create_user_command(
                "OpenAllFolds",
                function()
                    ufo.openAllFolds()
                end,
                { nargs = 0 }
            )

            vim.api.nvim_create_user_command(
                "CloseAllFolds",
                function()
                    ufo.closeAllFolds()
                end,
                { nargs = 0 }
            )

            ibl.setup({
                scope = {
                    show_start = false,
                    show_end = false
                },
                exclude = {
                    filetypes = {
                        "dashboard"
                    }
                }
            });
        end,
    },
    {
        'NvChad/nvim-colorizer.lua', -- Color Highlight
        config = function()
            require('colorizer').setup({
                user_default_options = { css = true, mode = "virtualtext", virtualtext = "󱓻", }
            })
        end,
    },
    {
        "echasnovski/mini.animate", -- Scroll Animation
        event = "VeryLazy",
        config = function()
            local animate = require("mini.animate")
            animate.setup({
                cursor = {
                    -- Animate for 200 milliseconds with linear easing
                    timing = animate.gen_timing.linear({ duration = 25, unit = 'total' }),

                    -- Animate with shortest line for any cursor move
                    path = animate.gen_path.line({
                        predicate = function() return true end,
                    }),
                },
                scroll = {
                    enable = false,
                }
            })
        end,

    },
    {
        "b0o/incline.nvim", -- Floating Statusline
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
        "folke/noice.nvim", -- UI For Messages, CMDLine, and Popmenu
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = false,        -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                }
            })
        end
    },
    {
        'akinsho/nvim-bufferline.lua', -- Buffer Tabs
        config = function()
            require("bufferline").setup({
                options = {
                    always_show_bufferline = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level)
                        local icon = ""

                        if level:match("error") then
                            icon = ""
                        elseif level:match("warning") then
                            icon = ""
                        end

                        return " " .. icon
                    end
                },
                highlights = {
                    modified = { fg = '#ffb86c' },
                    modified_selected = { fg = '#ffb86c' },
                    buffer_selected = { italic = false },
                    diagnostic_selected = { italic = false },
                    hint_selected = { italic = false },
                    hint_diagnostic_selected = { italic = false },
                    info_selected = { italic = false },
                    warning_selected = { italic = false },
                    warning_diagnostic_selected = { italic = false },
                    error_selected = { italic = false },
                    error_diagnostic_selected = { italic = false },
                },
            })
        end,

    },
}
