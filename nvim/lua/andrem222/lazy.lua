local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        { import = "andrem222.plugins" },
    },

    {
        checker = { enable = true },
        install = { colorscheme = { "dracula" } },
        ui = { border = "single" },
        performance = {
            cache = { enabled = true },
            rtp = {
                -- disable some rtp plugins
                disabled_plugins = {
                    "gzip",
                    "netrwPlugin",
                    "rplugin",
                    "tarPlugin",
                    "tohtml",
                    "tutor",
                    "zipPlugin",
                }
            }
        }
    })
