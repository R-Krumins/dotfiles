return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()

			require("oil").setup({
				view_options = {
					show_hidden = true,
					is_hidden_file = function(name, bufnr)
						local m = name:match("^%.")
						return m ~= nil
					end,
					-- This function defines what will never be shown, even when `show_hidden` is set
					is_always_hidden = function(name, bufnr)
						print(name)
						if name == ".." or name == ".git" then
							return true
						end
						return false
					end,
				},
			})


			vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Current Directory" })
		end,
	}
}
