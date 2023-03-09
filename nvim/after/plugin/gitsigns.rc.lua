-- Call gitsigns
local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

-- set gitsigns
gitsigns.setup()
