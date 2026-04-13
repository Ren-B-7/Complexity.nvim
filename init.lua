vim.g.mapleader = " "
vim.g.maplocalleader = "`"

if vim.g.neovide then
	vim.o.guifont = "Source Code Pro:h12"
end

vim.loader.enable()

_ = require("config.opts")
require("config.lazy")
require("config.keymaps")
require("config.autocmd")

require("utils.commands").start()
