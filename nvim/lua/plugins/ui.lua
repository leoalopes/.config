return {
    {
        'stevearc/dressing.nvim',
        opts = {
            input = {
                enabled = true
            },
            select = {
                enabled = false
            }
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
}
