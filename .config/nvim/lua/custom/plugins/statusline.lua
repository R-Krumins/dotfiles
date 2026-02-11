local function theme()
	local colors = {
		darkgray = "#16161d",
		gray = "#727169",
		bg = "None",
		normal = "#7e9cd8",
		insert = "#98bb6c",
		visual = "#ffa066",
		replace = "#e46876",
		command = "#e6c384",
	}

	local line = { fg = colors.gray, bg = colors.bg }

	return {
		inactive = {
			a = { fg = colors.gray, bg = colors.bg, gui = "bold" },
			b = line,
			c = line
		},
		visual = {
			a = { fg = colors.visual, bg = colors.bg, gui = "bold" },
			b = line,
			c = line
		},
		replace = {
			a = { fg = colors.replace, bg = colors.bg, gui = "bold" },
			b = line,
			c = line
		},
		normal = {
			a = { fg = colors.normal, bg = colors.bg, gui = "bold" },
			b = line,
			c = line
		},
		insert = {
			a = { fg = colors.insert, bg = colors.bg, gui = "bold" },
			b = line,
			c = line
		},
		command = {
			a = { fg = colors.command, bg = colors.bg, gui = "bold" },
			b = line,
			c = line
		},
	}
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
		local icon = require("custom.icons")
		local lualine = require("lualine")

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
				theme = theme(),
				globalstatus = true,
				section_separators = "",
				component_separators = "",
				disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { {"filename", path = 1 }, lsp_status },
				lualine_x = { diff, diagnostics},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
		})
    end,
}
