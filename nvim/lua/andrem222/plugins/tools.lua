return {
    -- Tools
    {
        'nvim-telescope/telescope.nvim', -- File Explorer
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim" -- Selection UI
        },
        config = function()
            local telescope = require("telescope")
            local actions = require('telescope.actions')
            local builtin = require("telescope.builtin")
            local function telescope_buffer_dir()
                return vim.fn.expand('%:p:h')
            end

            local fb_actions = require "telescope".extensions.file_browser.actions
            local themes = require("telescope.themes")

            telescope.setup {
                defaults = {
                    mappings = {
                        n = {
                            ["q"] = actions.close
                        }
                    }
                },
                extensions = {
                    ["ui-select"] = { themes.get_dropdown({}) },
                    file_browser = {
                        theme = "dropdown",
                        hijack_netrw = true,
                        mappings = {
                            -- Insert
                            ["i"] = {
                                ["<C-w>"] = function() vim.cmd('normal vbd') end,
                            },
                            ["n"] = {
                                -- Custom normal mode mappings
                                ["N"] = fb_actions.create,
                                ["C"] = fb_actions.copy,
                                ["h"] = fb_actions.goto_parent_dir,
                                ["<C-d>"] = fb_actions.remove,
                                ["R"] = fb_actions.rename,
                                ["v"] = actions.select_vertical,
                                ["x"] = actions.select_horizontal,
                                ["/"] = function()
                                    vim.cmd('startinsert')
                                end
                            }
                        }
                    }
                }
            }

            telescope.load_extension("file_browser")
            telescope.load_extension("ui-select")
            telescope.load_extension('harpoon')

            -- Bindings
            vim.api.nvim_create_user_command(
                "FileParse",
                function()
                    builtin.find_files({
                        no_ignore = false,
                        hidden = true
                    })
                end,
                { nargs = 0 }
            )


            vim.api.nvim_create_user_command(
                "ResumeSearch",
                function()
                    builtin.resume()
                end,
                { nargs = 0 }
            )

            vim.api.nvim_create_user_command(
                "BrowseFiles",
                function()
                    telescope.extensions.file_browser.file_browser({
                        path = "%:p:h",
                        cwd = telescope_buffer_dir(),
                        respect_gitignore = false,
                        hidden = true,
                        grouped = true,
                        previewer = false,
                        initial_mode = "normal",
                        layout_config = { height = 40 }
                    })
                end,
                { nargs = 0 }
            )

            vim.api.nvim_create_user_command(
                "Harpoon",
                function()
                    telescope.extensions.harpoon.marks(themes.get_dropdown({ previewer = false }))
                end,
                { nargs = 0 }
            )
        end
    },
    {
        'glepnir/lspsaga.nvim', -- Tools
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = { separator = "  " },
                ui = {
                    border = 'rounded',
                    code_action = ""
                }
            })
        end,
    },
    {
        'ThePrimeagen/harpoon', -- Bookmarking
        config = function()
            vim.api.nvim_create_user_command(
                "HarpoonMark",
                function()
                    require 'harpoon.mark'.add_file()
                    vim.notify(
                        vim.fn.expand('%:t') ..
                        " [" .. vim.api.nvim_win_get_cursor(0)[1] .. ":" .. vim.api.nvim_win_get_cursor(0)[2] .. "]",
                        "info",
                        {
                            icon = "",
                            title = "Bookmarked"
                        })
                end,
                { nargs = 0 }
            )
        end,
    },
    {
        'nvimtools/none-ls.nvim', -- Linter and Formatting
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                border = 'single',
                sources = {
                    -- Formatting
                    null_ls.builtins.formatting.prettier.with({
                        extra_args = function(params)
                            return params.options
                                and params.options.tabSize
                                and {
                                    "--tab-width",
                                    params.options.tabSize,
                                    "--trailing-comma none",
                                    "--no-semi",
                                    "--arrow-parens avoid",
                                    "--single-quote",
                                }
                        end,
                    }),
                    null_ls.builtins.formatting.clang_format.with({
                        extra_args = { "--style=Microsoft" }
                    }),
                    null_ls.builtins.formatting.autopep8,

                    -- Diagnostics
                    null_ls.builtins.diagnostics.eslint_d.with({
                        diagnostics_format = '[eslint] #{m}\n(#{c})'
                    })
                }
            })
        end,
    },
    {
        'lewis6991/gitsigns.nvim', -- Git Info
        config = function()
            -- set gitsigns
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 100
                },
                current_line_blame_formatter = '   <author>, <author_time:%R> • <summary>'
            })
        end,
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
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapUIStop' })
            vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapUIConditionOutline' })
            vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapUILogOutline' })
            vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapUIThread' })
            vim.fn.sign_define('DapBreakpointRejected', { text = '󰜺', texthl = 'DapUIStop' })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
        end,
    },
    {
        "andymass/vim-matchup", -- Improve Pair Matching
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    }
}
