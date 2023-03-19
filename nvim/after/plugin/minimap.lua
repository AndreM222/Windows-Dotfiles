local status, minimap = pcall(require, "codewindow")
if (not status) then return end

minimap.setup()

vim.api.nvim_create_user_command(
    'ToggleMinimap',
    function ()
        minimap.toggle_minimap()
    end,
    { nargs = 0 }
)
