return {
	"folke/flash.nvim",
	enabled = true,
	lazy = true,
	config = false,
	opts = {
		modes = {
			char = {
				enabled = true,
				keys = { "f", "F", "t", "T" },
			},
			search = { enabled = false },
		},
	},
	keys = {
		{
			"gs",
			function()
				require("flash").jump()
			end,
			desc = "Flash jump anywhere",
			mode = { "n", "x", "o" },
		},
		{
			"<leader>ii",
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter jump",
			mode = { "n", "x", "o" },
		},
		{
			"<leader>iR",
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash Treesitter search",
			mode = { "n", "x", "o" },
		},
		{
			"<leader>ir",
			function()
				require("flash").remote()
			end,
			desc = "Flash remote (act in another window)",
			mode = { "o" },
		},
		{
			"<Tab>",
			function()
				require("flash").jump({ continue = true })
			end,
			mode = { "n" },
			desc = "Keep JUMPING!",
		},
	},
}
