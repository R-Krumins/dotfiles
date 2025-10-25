return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup {
				-- transparent = true,
				-- styles = {
				-- 	sidebars = "transparent",
				-- 	floats = "transparent",
				-- },
			}
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000 ,
		config = function ()
			require("gruvbox").setup({
				overrides = {
					SignColumn = {bg = "none"}
				},
				dim_inactive = false,
				transparent_mode = false,
			})
		end
	},
	{ "blazkowolf/gruber-darker.nvim" }
}
