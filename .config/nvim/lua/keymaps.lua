local map = vim.keymap.set

-- blasphemy!
map("n", "<C-S>", "<cmd>w<CR>", { desc = "write file" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

map("n", "<leader>tw", function()
  if vim.opt.list:get() then
    vim.opt.list = false
    print("Whitespace OFF")
  else
    vim.opt.list = true
    print("Whitespace ON")
  end
end, { desc = "[T]oggle [W]hitespace" })

map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight search'})
