if vim.loader then
    vim.loader.enable()
end

_G.dd = function (...)
    require("andrem222.debug")
end

-- Startup settings
require('andrem222.config')

-- Lazy setup and plugins
require('andrem222.lazy')

-- Theme modifications
require('andrem222.theme')

-- Mapping of keys
require('andrem222.bindings')

vim.cmd([[
    " Theme Setup
    colorscheme dracula 

    " Remove highlight on movement
    autocmd CursorMoved * set nohlsearch
    nnoremap n n:set hlsearch<cr>
]])
