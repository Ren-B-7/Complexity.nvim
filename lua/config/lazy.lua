-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
	defaults = { lazy = true },
	install = { colorscheme = { "Catppuccin" } },
	checker = { enabled = false },
	spec = {
		-- import your plugins
		{ import = "plugins.splash-screen" },
		{ import = "plugins.protocols-utils" },
		{ import = "plugins.language-based-plugins" },
		{ import = "plugins.file-tree" },
		{ import = "plugins.flow-control" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.terminal" },
		{ import = "plugins.git" },
		{ import = "plugins.theme" },
		{ import = "plugins.general" },
		{ import = "plugins.session-manager" },
		{ import = "plugins.folding" },
		{ import = "plugins.random" },
		{ import = "plugins.which-key" },
	},
	git = { timeout = 500 },
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"tar",
				"tarPlugin",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
			},
		},
	},
})
