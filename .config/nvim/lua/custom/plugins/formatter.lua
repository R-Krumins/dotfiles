return {
	{
		'stevearc/conform.nvim',
		opts = {},
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					json = {"prettier"},
					html = { "prettier" },
					css = { "prettier" },
				},
			})

			-- Toggle variable
			vim.g.autoformat_enabled = true
			
			-- Auto format on save (only if enabled)
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					if vim.g.autoformat_enabled then
						conform.format({ bufnr = args.buf })
					end
				end,
			})

			vim.keymap.set("n", "<leader>tf", function()
				vim.g.autoformat_enabled = not vim.g.autoformat_enabled
				print("Autoformat: " .. (vim.g.autoformat_enabled and "ON" or "OFF"))
			end, { desc = "[T]oggle [F]ormat on save" })
		end,
	}
}
