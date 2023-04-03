local dracula = require("dracula")

dracula.setup({
    colors = { bg = "NONE" },

    overrides = {

        EndOfBuffer = { fg = "#282A36" },
        DiagnosticWarn = { fg = dracula.colors().orange },
        WarningMsg = { fg = dracula.colors().orange, },
        DiagnosticUnderlineWarn = { undercurl = true, sp = dracula.colors().orange, },
        DiagnosticSignWarn = { fg = dracula.colors().orange, },
        DiagnosticFloatingWarn = { fg = dracula.colors().orange, },
        DiagnosticVirtualTextWarn = { fg = dracula.colors().orange, },
        LspDiagnosticsDefaultWarning = { fg = dracula.colors().orange, },
        LspDiagnosticsUnderlineWarning = { fg = dracula.colors().orange, undercurl = true, },
        BufferLineFill = { bg = "NONE" },
        CursorLineNr = { fg = "Orange" },
        FloatBorder = { fg = dracula.colors().comment },
        VertSplit = { fg = dracula.colors().comment },
        Search = { fg = dracula.colors().orange, bg = "#585d9a" },
        Label = { fg = dracula.colors().pink },
        Identifier = { fg = dracula.colors().fg },
        IndentBlanklineContextChar = { fg = dracula.colors().comment, nocombine = true },
        MatchParen = { fg = dracula.colors().green, underline = true, },
            Function = { fg = dracula.colors().green },
        Number = { fg = dracula.colors().purple },
        Directory = { fg = dracula.colors().purple },
        Constant = { fg = dracula.colors().purple },
        ['@variable'] = { fg = dracula.colors().purple, },
        Pmenu = { fg = "white", bg = dracula.colors().menu, },
        StatusLine = { fg = dracula.colors().white, bg = "#292D3E" },
        StatusLineTerm = { fg = dracula.colors().white, bg = "#292D3E" },
        debugPc = { bg = dracula.colors().selection },
        DapUIThread = { fg = dracula.colors().green },
        DapUIRestart = { fg = dracula.colors().green },
        DapUIRestartNC = { fg = dracula.colors().green },
        DapUIPlayPause = { fg = dracula.colors().green },
        DapUIPlayPauseNC = { fg = dracula.colors().green },
        DapUIBreakpointsInfo = { fg = dracula.colors().green },
        DapUIWatchesValue = { fg = dracula.colors().green },
        DapUIBreakpointsCurrentLine = { fg = dracula.colors().green },
        DapUICurrentFrameName = { fg = dracula.colors().green },
        DapUIStop = { fg = dracula.colors().red },
        DapUIWatchesError = { fg = dracula.colors().red },
        DapUIWatchesEmpty = { fg = dracula.colors().red },
        GitSignsAddLn = { bg = "#2C453F" },
        GitSignsDeleteLn = { bg = "#6D393F" }
    },

    transparent_bg = true,
    show_end_of_buffer = true
})
