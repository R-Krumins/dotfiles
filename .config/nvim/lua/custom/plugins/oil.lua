local oil = {"stevearc/oil.nvim"}
oil.dependencies = { "nvim-tree/nvim-web-devicons" }

oil.config = function()
	require("oil").setup({
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, bufnr)
				return name == ".."
			end,
		},
		float = {
			max_width = 0.5,
			max_height = 0.5,
		}
	})

	-- KEYMAPS
	vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Current Directory" })
	-- Close Oil floating window with Esc
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "oil",
		callback = function()
			vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = true, desc = "Close Oil Float" })
		end,
	})
end

return oil
