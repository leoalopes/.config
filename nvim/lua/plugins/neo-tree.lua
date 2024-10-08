return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				source_selector = {
					statusline = false,
				},
				window = {
					mappings = {
						["l"] = "open",
					},
				},
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
				},
				event_handlers = {
					{
						event = "file_open_requested",
						handler = function()
							require("neo-tree.command").execute({ action = "close" })
						end,
					},
				},
			})

			vim.keymap.set(
				"n",
				"<leader>e",
				":Neotree filesystem reveal left toggle=true<CR>",
				{ desc = "Toggle filesystem" }
			)
		end,
	},
}
