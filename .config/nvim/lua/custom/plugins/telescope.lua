return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make'
			},
		},
		config = function()
			require("telescope").setup {
				defaults = {
					file_ignore_patterns = {
						"node_modules/",
						".git/",
						"dist/",
						"target/",
						"build/",
					},
				},
				extensions = {
					fzf = {}
				},
				pickers = {
					find_files = {
						hidden = true,
					}
				}
			}

			require("telescope").load_extension("fzf")

			-- KEY MAPS
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch [G]rep' })
     		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      		vim.keymap.set('n', '<leader>sr', builtin.lsp_references, { desc = '[S]earch [R]eferences' })
      		vim.keymap.set('n', '<leader>st', builtin.colorscheme, { desc = '[S]earch [T]hemes' })
		end,
	}
}
