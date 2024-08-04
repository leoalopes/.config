-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigate vim panes better
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics" })

-- Move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Maintain the cursor in the center
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
		end

		-- Jump to the definition of the word under your cursor.
		-- Note: CTRL + T returns back to original buffer
		map("gd", require("telescope.builtin").lsp_definitions, "Go to definition")

		-- For example, in C this would take you to the header.
		map("gD", vim.lsp.buf.declaration, "Go to declaration")

		-- Find references for the word under your cursor.
		map("gr", require("telescope.builtin").lsp_references, "Go to references")

		-- Jump to the implementation of the word under your cursor.
		map("gI", require("telescope.builtin").lsp_implementations, "Go to implementation")

		-- Jump to the type of the word under your cursor.
		map("gt", require("telescope.builtin").lsp_type_definitions, "Type definition")

		-- Fuzzy find all the symbols in your current document.
		map("<leader>cf", require("telescope.builtin").lsp_document_symbols, "Find symbols")

		-- Fuzzy find all the symbols in your current workspace.
		map("<leader>cF", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Find symbols in workspace")

		-- Rename the variable under your cursor.
		map("<leader>cr", vim.lsp.buf.rename, "Rename")

		-- Execute a code action, usually your cursor needs to be on top of an error
		map("<leader>ca", vim.lsp.buf.code_action, "Code actions")

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		-- Enable inlay hints
		vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
	end,
})
