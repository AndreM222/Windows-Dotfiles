-- Call Lualine
local status1, lualine = pcall(require, 'lualine')
if (not status1) then return end

lualine.setup({})
