return {
	{ "blazkowolf/gruber-darker.nvim" },
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
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					}
				}
			})
		end,
	},
}
