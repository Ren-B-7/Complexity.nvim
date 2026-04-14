local g = vim.g
local opt = vim.opt

g.autoformat = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"

-- Show the current  mode for the nvim program
opt.showmode = false

opt.cursorline = true
opt.cursorlineopt = "both"
opt.foldcolumn = "1"
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.textwidth = 80
opt.expandtab = true

opt.listchars = { eol = "¬", tab = ">>", trail = "·", space = "␣" }

-- Spelling settings
opt.spell = true
opt.spelllang = { "en" }

opt.wrap = false
opt.smoothscroll = true

opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.modifiable = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- Set nvim clipboard and system clipboard
opt.clipboard = "unnamedplus"

opt.scrolloff = 5
opt.updatetime = 50

opt.termguicolors = true
opt.equalalways = false
opt.winminwidth = 10
opt.winwidth = 10

opt.sessionoptions = { -- required
	"buffers",
	"tabpages",
	"globals",
	"resize",
}

g.codi_enabled = false
