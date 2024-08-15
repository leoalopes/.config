return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader> ", builtin.find_files, { desc = "Find file" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file" })
            vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Fuzzy find" })
            vim.keymap.set("n", "<leader>f/", builtin.live_grep, { desc = "Fuzzy find" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
            vim.keymap.set("n", "<leader>fc", builtin.resume, { desc = "Continue" })
        end,
    },
}
