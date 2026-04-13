return {
	"doctorfree/cheatsheet.nvim",
	lazy = true,
	enabled = true,
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	opts = {
		bundled_cheetsheets = true,
		bundled_plugin_cheatsheets = true,
		include_only_installed_plugins = true,
	},
	keys = { { "<leader>cheat", "<cmd>Cheatsheet<CR>", mode = { "n" }, desc = "Opens up the telescope cheatsheet" } },
}
