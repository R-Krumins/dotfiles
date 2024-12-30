return {
	-- MAIN LSP CONFIG
	{
		"neovim/nvim-lspconfig", -- default configs for various lsps
		dependencies = {
			"williamboman/mason.nvim", -- language server "package manager"
			"williamboman/mason-lspconfig.nvim",
			'saghen/blink.cmp',
		},
		config = function()
			-- MASON SETUP
			require("mason").setup()
			require("mason-lspconfig").setup {
				-- must have lsps
				ensure_installed = { "lua_ls", "clangd" },
			}

			-- SETUP LSPS INSTALLED VIA MASON
			local capabilities = require('blink.cmp').get_lsp_capabilities()
			require("mason-lspconfig").setup_handlers {
				function (server_name)
					require("lspconfig")[server_name].setup { capabilities = capabilities }
				end,
			}

		end,
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
			keymap = { preset = 'default' },

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
