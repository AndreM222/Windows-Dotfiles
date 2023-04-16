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
        "c_sharp",
        "python",
        "javascript"
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

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }