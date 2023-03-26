local status, ufo = pcall(require, "ufo")
if (not status) then return end

ufo.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local language_servers = require("lspconfig").util.available_servers()
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
    })
end

vim.api.nvim_create_user_command(
    "OpenAllFolds",
    function ()
        ufo.openAllFolds()
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    "CloseAllFolds",
    function ()
        ufo.closeAllFolds()
    end,
    { nargs = 0 }
)

vim.o.foldcolumn = "1"
vim.o.statuscolumn = '%s%=%l %{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " } '
