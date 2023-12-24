local status1, ibl = pcall(require, "ibl")
if (not status1) then return end

local status2, ufo = pcall(require, "ufo")
if (not status2) then return end

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
    function()
        ufo.openAllFolds()
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    "CloseAllFolds",
    function()
        ufo.closeAllFolds()
    end,
    { nargs = 0 }
)

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "1"
vim.o.statuscolumn = '%s%=%{v:relnum?v:relnum:v:lnum} %{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " } '

ibl.setup({
    scope = {
        show_start = false,
        show_end = false
    },
    exclude = {
        filetypes = {
            "dashboard"
        }
    }
});
