return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>ha",
				function() 
					harpoon:list():add()
					local file = vim.fn.expand("%:t")
					print(file .. " added to harpoon")
				end,
				{ desc = "[H]arpoon [A]dd" }
			)
			vim.keymap.set("n", "<leader>hs", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "[H]aproon [S]how" })

			vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "[1]st harpoon file" })
			vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "[2]nd harpoon file" })
			vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "[3]rd harpoon file" })
			vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "[4]th harpoon file" })

			vim.keymap.set("n", "<leader>9", function() harpoon:list():prev() end, { desc = "Harpoon prev file" })
			vim.keymap.set("n", "<leader>0", function() harpoon:list():next() end, { desc = "Harpoon next file" })

			vim.keymap.set("n", "<leader>hc",
				function()
					harpoon:list():clear()
					print("Cleared harpoon list")
				end,
				{ desc = "[H]arpoon [C]lear list" }
			)
		end,
	}
}
