require('lualine').setup({})
require("nvim-tree").setup({})

-- Call gitsigns
local status2, gitsigns = pcall(require, "gitsigns")
if (not status2) then return end

-- set gitsigns
gitsigns.setup()

-- Call buffer
local status3, bufferline = pcall(require, "bufferline")
if (not status3) then return end

-- To bufferline
bufferline.setup({
    options = {
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
    },
    highlights = {
        separator = {fg = '#282A36'},
        separator_selected = {fg = '#073642'}
    }
})

-- auto_comment
require('Comment').setup()
