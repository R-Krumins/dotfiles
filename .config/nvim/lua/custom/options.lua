--  Mapleader
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Nerd Font
vim.g.have_nerd_font = true

-- Save undo history
vim.opt.undofile = true

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.smartindent = true
