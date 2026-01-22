return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			local actions = require("diffview.actions")

			require("diffview").setup({
				keymaps = {
					view = {
						{
							"n",
							"<leader>ge",
							actions.focus_files,
							{ desc = "Bring focus to the file panel" },
						},
						{
							"n",
							"<leader>gb",
							actions.toggle_files,
							{ desc = "Toggle the file panel." },
						},
						{
							"n",
							"<leader>gco",
							actions.conflict_choose("ours"),
							{ desc = "Choose the OURS version of a conflict" },
						},
						{
							"n",
							"<leader>gct",
							actions.conflict_choose("theirs"),
							{ desc = "Choose the THEIRS version of a conflict" },
						},
						{
							"n",
							"<leader>gcb",
							actions.conflict_choose("base"),
							{ desc = "Choose the BASE version of a conflict" },
						},
						{
							"n",
							"<leader>gca",
							actions.conflict_choose("all"),
							{ desc = "Choose all the versions of a conflict" },
						},
						{
							"n",
							"<leader>gcO",
							actions.conflict_choose_all("ours"),
							{ desc = "Choose the OURS version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>gcT",
							actions.conflict_choose_all("theirs"),
							{ desc = "Choose the THEIRS version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>gcB",
							actions.conflict_choose_all("base"),
							{ desc = "Choose the BASE version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>gcA",
							actions.conflict_choose_all("all"),
							{ desc = "Choose all the versions of a conflict for the whole file" },
						},
					},
					file_panel = {
						{ "n", "<leader>ge", actions.focus_files, { desc = "Bring focus to the file panel" } },
						{ "n", "<leader>gb", actions.toggle_files, { desc = "Toggle the file panel" } },
					},
					file_history_panel = {
						{ "n", "<leader>ge", actions.focus_files, { desc = "Bring focus to the file panel" } },
						{ "n", "<leader>gb", actions.toggle_files, { desc = "Toggle the file panel" } },
					},
				},
			})

			vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>", { desc = "Open git diff" })
		end,
	},
}
