local dracula = require("dracula")

dracula.setup({
    -- Remove Background Color
    colors = { bg = "NONE" },

    overrides = {
        -- Hide buffers
        EndOfBuffer = { fg = "#282A36" },
        BufferLineFill = { bg = "NONE" },

        -- Diagnostics
        DiagnosticWarn = { fg = dracula.colors().orange },
        WarningMsg = { fg = dracula.colors().orange },
        DiagnosticUnderlineWarn = { undercurl = true, sp = dracula.colors().orange },
        DiagnosticSignWarn = { fg = dracula.colors().orange },
        DiagnosticFloatingWarn = { fg = dracula.colors().orange },
        DiagnosticVirtualTextWarn = { fg = dracula.colors().orange },
        LspDiagnosticsDefaultWarning = { fg = dracula.colors().orange },
        LspDiagnosticsUnderlineWarning = { fg = dracula.colors().orange, undercurl = true },

        -- Borders
        FloatBorder = { fg = dracula.colors().comment },
        VertSplit = { fg = dracula.colors().comment },

        Label = { fg = dracula.colors().pink },
        Identifier = { fg = dracula.colors().fg },
        MatchParen = { fg = dracula.colors().green, underline = true },

        -- Missing fg color and extra setup
        IndentBlanklineContextChar = { fg = dracula.colors().comment, nocombine = true },

        -- Search
        IncSearch = { bg = "#957251" },
        CurSearch = { bg = "#957251" },
        Search = { bg = dracula.colors().selection },

        -- Extra
        CursorLineNr = { fg = "Orange" },

        -- Variable
        Function = { fg = dracula.colors().green },
        Number = { fg = dracula.colors().purple },
        Directory = { fg = dracula.colors().purple },
        Constant = { fg = dracula.colors().purple },
        ['@variable'] = { fg = dracula.colors().purple, },

        -- Completion text
        Pmenu = { fg = dracula.colors().fg, bg = dracula.colors().menu },

        -- Saga Separator
        SagaWinbarSep = { fg = dracula.colors().comment },

        -- Info Boxes
        NullLsInfoBorder = { fg = dracula.colors().comment },
        LspInfoBorder = { fg = dracula.colors().comment },
        MasonHighlight = { fg = dracula.colors().green, default = true },

        -- Gitsigns
        GitSignsCurrentLineBlame = { fg = dracula.colors().selection },

        -- Git Diff
        DiffAdd = { bg = "#2C453F" },
        DiffAddText = { bg = "#377165" },
        DiffviewDiffDelete = { fg = dracula.colors().selection },
        DiffAddAsDelete = { bg = "#533238" },
        DiffDelete = { bg = "#6D393F" },
        DiffDeleteText = { bg = "#a16262" },

        DashboardHeader = { fg = "#ffffff" },
        DashboardFooter = { fg = "#ffffff" },
    },

    transparent_bg = true,
    show_end_of_buffer = true -- Enable for setup of true transparency
})

-- For vim muli cursor
vim.g.VM_highlight_matches = 'hi VM_Mono guibg=#FF5555'
