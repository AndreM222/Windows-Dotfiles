
local status1, mason = pcall(require, "mason")
if (not status1) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
local status3, null_ls = pcall(require, "mason-null-ls")
if (not status3) then return end

-- Setup Mason
mason.setup()

-- Setuo Null-ls on mason
null_ls.setup({
    ensure_installed = {"latexindent", "prettierd"},
    automatic_setup = true
})

-- Setup lspconfig on mason
lspconfig.setup({
    ensure_installed = {
        "clangd",
        "html",
        "lua_ls",
        "pyright",
        "texlab",
        "tsserver",
        "vimls"
    },
    automatic_installation = true
})
