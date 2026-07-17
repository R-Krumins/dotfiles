vim.pack.add({
	{ src = "https://github.com/blazkowolf/gruber-darker.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
})

vim.g.mapleader = " "
vim.cmd.colorscheme("gruber-darker")

-- add color highlight to mini.pick selected search item (for gruber-darker)
vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { bg = "#453d41", bold = true })

vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader>rn", function()
  vim.cmd.source(vim.env.MYVIMRC)
  print("Config reloaded")
end)

vim.opt.clipboard = "unnamedplus"

require("mini.pick").setup()
require("mason").setup()

vim.lsp.enable("lua_ls")

vim.keymap.set("n", "<C-f>", MiniPick.builtin.files);
vim.keymap.set("n", "<leader>sh", MiniPick.builtin.help);
vim.keymap.set("n", "<leader>sg", MiniPick.builtin.grep_live);
vim.keymap.set("n", "<leader>sb", MiniPick.builtin.buffers);

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
-- vim.opt.showmode = false

vim.g.have_nerd_font = true -- Nerd font

vim.opt.autoread = true -- auto-reload if changes outside of nvim

vim.opt.iskeyword:append("-") -- include '-' in words
