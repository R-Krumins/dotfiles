local o = vim.opt

-- Tabs
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.autoindent = true -- Copy indent from current line

-- Line Numbers
o.number = true
o.relativenumber = true

o.ignorecase = true -- case insensitive search
o.smartcase = true -- case sensitive search if search term includes uppercase

o.undofile = true -- Save undo history

o.cursorline = false -- highlight current line

o.signcolumn = 'yes' -- Keep signcolumn on by default

-- Don't show the mode, since it's already in the status line
o.showmode = false

vim.g.have_nerd_font = true -- Nerd font

o.autoread = true -- auto-reload if changes outside of nvim

o.iskeyword:append("-") -- include '-' in words

o.termguicolors = true

-- how to display whitespace (if o.list on)
o.listchars = {
  tab = "▸ ",
  trail = "·",
  space = "·",
  eol = "↴",
}
