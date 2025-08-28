return {
	"ThePrimeagen/harpoon",
	lazy = true,
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>az",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle Harpoon quick menu",
		},
		{
			"<leader>aa",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add file to Harpoon",
		},
		{
			"<leader>aj",
			function()
				require("harpoon.ui").nav_next()
			end,
			desc = "Navigate to next Harpoon file",
		},
		{
			"<leader>ak",
			function()
				require("harpoon.ui").nav_prev()
			end,
			desc = "Navigate to previous Harpoon file",
		},
	},
}
