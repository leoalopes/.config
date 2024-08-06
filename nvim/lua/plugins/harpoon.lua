return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon.setup()

            vim.keymap.set("n", "<leader>hh", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Open harpoon" })
            vim.keymap.set("n", "<leader>fh", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Open harpoon" })

            vim.keymap.set("n", "<leader>ha", function()
                harpoon:list():add()
            end, { desc = "Add to harpoon" })

            vim.keymap.set("n", "Q", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "W", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "E", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "R", function()
                harpoon:list():select(4)
            end)

            vim.keymap.set("n", "H", function()
                harpoon:list():prev()
            end)
            vim.keymap.set("n", "L", function()
                harpoon:list():next()
            end)
        end,
    },
}
