return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
		local icon = require("custom.icons")
		local lualine = require("lualine")
		local theme = require("custom.theme")

		local filetype = { "filetype", icon_only = true }

		local lsp_status = {
			"lsp_status",
			icon = "", -- f013
			symbols = {
				spinner = icon.spinner,
				done = false,
				separator = " ",
			},
			-- List of LSP names to ignore (e.g., `null-ls`):
			ignore_lsp = {},
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = {
				error = icon.diagnostics.Error,
				hint = icon.diagnostics.Hint,
				info = icon.diagnostics.Info,
				warn = icon.diagnostics.Warning,
			},
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		local diff = {
			"diff",
			source = function()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end,
			symbols = {
				added = icon.git.LineAdded .. " ",
				modified = icon.git.LineModified .. " ",
				removed = icon.git.LineRemoved .. " ",
			},
			colored = true,
			always_visible = false,
		}

		lualine.setup({
			options = {
				theme = theme.theme(),
				globalstatus = true,
				section_separators = "",
				component_separators = "",
				disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { "filename", lsp_status },
				lualine_x = { diff, diagnostics, filetype },
				lualine_y = {},
				lualine_z = {},
			},
		})
    end,
}
