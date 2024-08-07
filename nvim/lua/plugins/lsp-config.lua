return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "html",
                    "cssls",
                    "tsserver",
                    "eslint",
                    "clangd",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                end,
            })
            lspconfig.eslint.setup({
                capabilities = capabilities,
            })
            lspconfig.gleam.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
        end,
    },
}
