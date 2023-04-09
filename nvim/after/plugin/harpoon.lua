vim.api.nvim_create_user_command(
    "HarpoonMark",
    function ()
        require'harpoon.mark'.add_file()
        vim.notify(vim.fn.expand('%:t') .. " [" .. vim.api.nvim_win_get_cursor(0)[1] .. ":" .. vim.api.nvim_win_get_cursor(0)[2] .. "]", "info", {
                icon = "",
                title = "Bookmarked"
        })
    end,
    { nargs = 0 }
)
