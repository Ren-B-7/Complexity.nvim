return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "↑" },
				changedelete = { text = "·" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "↑" },
				changedelete = { text = "·" },
			},
		},
	},
	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy", lazy = true },
	-- { "sitiom/nvim-numbertoggle", lazy = true, event = { "InsertEnter" }, enabled = true },
}
