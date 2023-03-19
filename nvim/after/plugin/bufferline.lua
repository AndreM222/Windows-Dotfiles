-- Call buffer
local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

-- To bufferline
bufferline.setup({
    options = {
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
    },
    highlights = {
        buffer_selected = { bold = true},
        separator = {fg = '#282A36'},
        separator_selected = {fg = '#073642'}
    },
})
