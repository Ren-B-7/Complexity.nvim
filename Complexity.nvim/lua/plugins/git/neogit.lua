return {
	"NeogitOrg/neogit",
	lazy = true,
	enabled = true,
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = true,
}
