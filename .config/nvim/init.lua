require("config.options")
require("config.lazy")

vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { desc = 'Yank to system clipbaord' })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
