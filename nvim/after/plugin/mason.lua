
local status1, mason = pcall(require, "mason")
if (not status1) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
local status3, null_ls = pcall(require, "mason-null-ls")
if (not status3) then return end
local status4, dap = pcall(require, "mason-nvim-dap")
if (not status4) then return end

-- Setup Mason
mason.setup({
    ui = {
        border = "single",
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "⭕"
        }
    }
})

-- Setuo Null-ls on mason
null_ls.setup({
    ensure_installed = {"latexindent", "prettierd", "clang-format", "eslint_d"},
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
        "vimls",
        "csharp_ls",
        "tailwindcss",
        "cssls",
        "marksman"
    },
    automatic_installation = true
})

-- Setup dap on mason
dap.setup({
    ensure_installed = { "codelldb", "cppdbg" },
    automatic_installation = true,
    automatic_setup = true,
    handlers = nil
})
