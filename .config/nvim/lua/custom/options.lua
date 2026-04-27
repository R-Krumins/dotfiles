--  Mapleader
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Copy indent from current line

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive search if search term includes uppercase

vim.opt.undofile = true -- Save undo history

vim.opt.cursorline = false -- highlight current line

vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.g.have_nerd_font = true -- Nerd font

vim.opt.autoread = true -- auto-reload if changes outside of nvim

vim.opt.iskeyword:append("-") -- include '-' in words
