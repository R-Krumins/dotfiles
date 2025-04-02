return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup {
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			}
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000 ,
		config = true
	}
}
