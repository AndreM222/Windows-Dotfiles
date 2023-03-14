local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup({
    ensure_installed = {
        "markdown",
        "markdown_inline",
        "tsx",
        "toml",
        "php",
        "json",
        "yaml",
        "css",
        "html",
        "lua",
        "cpp",
        "c",
        "python",
    },
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    autotag = { enable = true }
})
