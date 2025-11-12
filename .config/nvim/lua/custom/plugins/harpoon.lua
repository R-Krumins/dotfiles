return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "[A]dd to harpoon" })
			vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toggle menu" })

			vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
			vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
			vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
			vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })

			vim.keymap.set("n", "<leader>9", function() harpoon:list():prev() end, { desc = "Harpoon prev file" })
			vim.keymap.set("n", "<leader>0", function() harpoon:list():next() end, { desc = "Harpoon next file" })

			vim.keymap.set("n", "<leader>ch", function() harpoon:list():clear() end, { desc = "[C]lear [H]arpoon list" })		end,
	}
}
