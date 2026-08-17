vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "lazy_init"
require "options"
require "keymaps"
require "commands"
require "run"


vim.lsp.enable({"lua_ls", "rust_analyzer", "ts_ls"})
vim.diagnostic.config({virtual_text = true})

pcall(require, "theme")

