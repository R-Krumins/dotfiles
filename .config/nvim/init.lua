require("custom.options")
require("custom.lazy")

vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { desc = 'Yank to system clipbaord' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight search'})

-- Fomat on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rs", "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
