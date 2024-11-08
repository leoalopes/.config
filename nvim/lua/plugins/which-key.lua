return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		dependencies = {
			"echasnovski/mini.nvim",
		},
		config = function()
			require("mini.icons").setup()
			require("which-key").setup()

			require("which-key").add({
				{ "<leader>b", group = "Buffer" },
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Debugger" },
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>h", group = "Harpoon" },
			})
		end,
	},
}
