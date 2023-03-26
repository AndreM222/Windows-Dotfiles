-- Call Lualine
local status1, lualine = pcall(require, 'lualine')
if (not status1) then return end

local cozynight = require('lualine.themes.palenight')

cozynight.insert.a.bg = '#f7397c'
cozynight.insert.b.fg = '#f7397c'
cozynight.visual.a.bg = '#ff940d'
cozynight.visual.b.fg = '#ff940d'

lualine.setup({
    options = {
        icons_enabled = true,
        theme = cozynight,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } } },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
