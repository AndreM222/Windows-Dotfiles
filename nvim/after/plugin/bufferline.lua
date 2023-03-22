-- Call buffer
local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

-- To bufferline
bufferline.setup({
    options = {
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        diagnostics = "nvim_lsp",
        modified_icon = "󰠘";
        diagnostics_indicator = function(count, level)
            local icon = ""

            if level:match("error") then icon = ""
            elseif level:match("warning") then icon = "" end

            return " " .. icon
        end
    },
    highlights = {
        modified = { fg = '#ffb86c' },
        modified_selected = { fg = '#ffb86c' },
        buffer_selected = { italic = false},
        diagnostic_selected = { italic = false},
        hint_selected = { italic = false},
        hint_diagnostic_selected = { italic = false},
        info_selected = { italic = false},
        warning_selected = { italic = false},
        warning_diagnostic_selected = { italic = false},
        error_selected= { italic = false},
        error_diagnostic_selected = { italic = false},

        separator = {fg = '#282A36'},
        separator_selected = {fg = '#073642'}
    },
})
