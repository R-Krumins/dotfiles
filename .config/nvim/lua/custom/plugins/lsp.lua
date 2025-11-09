return {
	-- MAIN LSP CONFIG
	{
		"neovim/nvim-lspconfig", -- default configs for various lsps
		dependencies = {
			"williamboman/mason.nvim", -- language server "package manager"
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			-- MASON SETUP
			require("mason").setup()
			vim.api.nvim_create_autocmd('LspAttach', require("custom.config.lsp-attach"))
		end,
	},

	-- AUTOMATICLY SETUP MASON LSPS WITH LSPCONFIG
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	-- NEOVIM API INFO FOR LUA LSP
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- AUTO-COMPLETION
	{
		'saghen/blink.cmp',
		-- optional: provides snippets for the snippet source
		dependencies = 'rafamadriz/friendly-snippets',

		version = '*',

		opts = {
			keymap = {
				preset = 'super-tab',
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
		},

		opts_extend = { "sources.default" }
	}
}
