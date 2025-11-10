local fidget = {"j-hui/fidget.nvim"}
fidget.opts = {}

fidget.config = function()
	require("fidget").setup({
		notification = {
			window = {
				winblend = 0
			}
		}
	})
end

return fidget
