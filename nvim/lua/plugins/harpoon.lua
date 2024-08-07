return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon.setup({
                settings = {
                    save_on_toggle = true,
                }
            })

            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<leader>hh", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Open harpoon" })
            vim.keymap.set("n", "<leader>fh", function()
                toggle_telescope(harpoon:list())
            end, { desc = "Find in harpoon" })

            vim.keymap.set("n", "<leader>ha", function()
                harpoon:list():add()
            end, { desc = "Add to harpoon" })

            vim.keymap.set("n", "<leader>hn", function()
                harpoon:list():next()
            end, { desc = "Next file" })
            vim.keymap.set("n", "<leader>hN", function()
                harpoon:list():prev()
            end, { desc = "Previous file" })

            vim.keymap.set("n", "<leader>h1", function()
                harpoon:list():select(1)
            end, { desc = "Select 1" })
            vim.keymap.set("n", "<leader>h2", function()
                harpoon:list():select(2)
            end, { desc = "Select 2" })
            vim.keymap.set("n", "<leader>h3", function()
                harpoon:list():select(3)
            end, { desc = "Select 3" })
            vim.keymap.set("n", "<leader>h4", function()
                harpoon:list():select(4)
            end, { desc = "Select 4" })
        end,
    },
}
