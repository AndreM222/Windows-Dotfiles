require'nvim-treesitter.configs'.setup ({

    ensure_installed = 
    {
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

    autotag = {
        enable = true,
    },

})
