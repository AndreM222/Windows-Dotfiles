-- Call gitsigns
local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

-- set gitsigns
gitsigns.setup({
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 100
    },
    current_line_blame_formatter = '   <author>, <author_time:%R> • <summary>'
})
