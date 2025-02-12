return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- require("tokyonight").setup {
			-- 	transparent = true,
			-- 	styles = {
			-- 		sidebars = "transparent",
			-- 		floats = "transparent",
			-- 	},
			-- }
			vim.cmd.colorscheme "tokyonight"
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					-- make floating windows transparent
					"LspFloatWinNormal",
					"Normal",
					"NormalFloat",
					"FloatBorder",
					"TelescopeNormal",
					"TelescopeBorder",
					"TelescopePromptBorder",
				},
			})
		end,
	},
}
