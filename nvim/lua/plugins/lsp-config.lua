return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { "mason-org/mason.nvim",           config = true,     version = "1.11.0" },
            { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local servers = {
                html = {},
                cssls = {},
                lua_ls = {},
                ts_ls = {
                    on_attach = function(client)
                        client.server_capabilities.documentFormattingProvider = false
                    end,
                },
                jsonls = {
                    on_attach = function(client)
                        client.server_capabilities.documentFormattingProvider = false
                    end,
                },
                eslint = {},
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--completion-style=bundled",
                        "--cross-file-rename",
                        "--header-insertion=iwyu",
                    },
                },
            }

            require("mason").setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "stylua",
            })
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        -- This handles overriding only values explicitly passed
                        -- by the server configuration above. Useful when disabling
                        -- certain features of an LSP (for example, turning off formatting for ts_ls)
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        server.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
                        if not server.capabilities.positionEncoding then
                            server.capabilities.positionEncoding = "utf-16"
                        end

                        vim.lsp.config(server_name, server)
                        vim.lsp.enable(server_name)
                    end,
                },
            })
        end,
    },
}
