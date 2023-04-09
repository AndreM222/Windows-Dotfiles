local status, startup = pcall( require ,'dashboard' )
if (not status) then return end

startup.setup({
    config = {
        header ={
            ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
            '                                                       ',
        },
        shortcut = {
            {
                desc = ' Files',
                group = 'Label',
                action = 'BrowseFiles',
                key = 'f',
            },
            {
                desc = ' Keymaps',
                group = 'DiagnosticHint',
                action = 'Telescope keymaps',
                key = 'k',
            },
            {
                desc = ' Dotfiles',
                group = 'Number',
                action = 'Telescope file_browser cwd=$HOME/Appdata/local/nvim', -- Change to your dotfiles path
                key = 'd',
            },
            {
                desc = '󰝒 New File',
                group = 'DiagnosticWarn',
                action = 'ene ',
                key = 'e',
            }
        },
        packages = { enable = false },
        footer = {
            "",
            "NVIM v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
        }
    }
})
