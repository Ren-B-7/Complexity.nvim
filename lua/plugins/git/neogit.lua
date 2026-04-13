return {
	"NeogitOrg/neogit",
	enabled = true,
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim",
		"folke/snacks.nvim",
	},
	cmd = { "Neogit" },
	config = true,
	keys = {
		{
			"<leader>gn", -- for commit popup
			function()
				require("neogit").open()
			end,
			desc = "Neogit buffer",
		},
		{
			"<leader>gc", -- for commit popup
			function()
				require("neogit").open({ "commit" })
			end,
			desc = "Neogit Commit",
		},
		{
			"<leader>gp", -- push
			function()
				require("neogit").open({ "push" })
			end,
			desc = "Neogit Push",
		},
		{
			"<leader>gd", -- pull
			function()
				require("neogit").open({ "pull" })
			end,
			desc = "Neogit Pull",
		},
	},
}
